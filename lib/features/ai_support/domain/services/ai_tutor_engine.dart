import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';
import 'package:diga/features/simulation/presentation/providers/simulation_quiz_provider.dart';
import 'package:diga/l10n/app_localizations.dart';

/// A single message in the AI tutor chat (rule-based, no external API).
class AiTutorMessage {
  const AiTutorMessage({
    required this.text,
    required this.isUser,
    this.isTyping = false,
  });

  final String text;
  final bool isUser;
  final bool isTyping;

  AiTutorMessage copyWith({String? text, bool? isUser, bool? isTyping}) {
    return AiTutorMessage(
      text: text ?? this.text,
      isUser: isUser ?? this.isUser,
      isTyping: isTyping ?? this.isTyping,
    );
  }
}

/// Context passed into the tutor for personalised offline responses.
class AiTutorContext {
  const AiTutorContext({
    required this.moduleId,
    required this.domainName,
    required this.scorePercent,
    required this.patientName,
    required this.conversationTitle,
    required this.wrongRationales,
    required this.weakPhaseLabels,
    required this.suggestedQuestions,
    this.isHomePreview = false,
  });

  final String moduleId;
  final String domainName;
  final int scorePercent;
  final String patientName;
  final String conversationTitle;
  final List<String> wrongRationales;
  final List<String> weakPhaseLabels;
  final List<String> suggestedQuestions;
  final bool isHomePreview;

  /// General coaching context for the home screen (no exam required).
  factory AiTutorContext.forHome({required AppLocalizations l10n}) {
    final domain = ClinicalDomainData.byId('mental');
    return AiTutorContext(
      moduleId: domain.scenarios.first.moduleId,
      domainName: domain.name,
      scorePercent: 0,
      patientName: 'Frau Holz',
      conversationTitle: domain.name,
      wrongRationales: const [],
      weakPhaseLabels: const [],
      suggestedQuestions: [
        l10n.aiTutorQuickDocumentation,
        l10n.aiTutorQuickPatientTalk,
        l10n.homeAiCoachQuickSafety,
      ],
      isHomePreview: true,
    );
  }

  factory AiTutorContext.fromQuiz({
    required SimulationQuizState quiz,
    required AppLocalizations l10n,
    String? patientName,
    String? conversationTitle,
    List<String> suggestedQuestions = const [],
  }) {
    final domain = ClinicalDomainData.domainForModule(quiz.moduleId);
    final wrong = <String>[];
    final weak = <String>[];
    final phaseMisses = <SimulationQuizPhase, int>{};
    final phaseTotals = <SimulationQuizPhase, int>{};

    for (final q in quiz.questions) {
      phaseTotals[q.phase] = (phaseTotals[q.phase] ?? 0) + 1;
      final selected = quiz.answers[q.id];
      if (selected == null || !q.isCorrect(selected)) {
        wrong.add(q.rationale);
        phaseMisses[q.phase] = (phaseMisses[q.phase] ?? 0) + 1;
      }
    }

    for (final phase in SimulationQuizPhase.values) {
      final total = phaseTotals[phase] ?? 0;
      if (total == 0) continue;
      final misses = phaseMisses[phase] ?? 0;
      final pct = ((total - misses) / total * 100).round();
      if (pct < 70) weak.add(phase.displayLabel(l10n));
    }

    return AiTutorContext(
      moduleId: quiz.moduleId,
      domainName: domain.name,
      scorePercent: quiz.scorePercent,
      patientName: patientName ?? 'Patient',
      conversationTitle: conversationTitle ?? domain.name,
      wrongRationales: wrong.take(3).toList(),
      weakPhaseLabels: weak,
      suggestedQuestions: suggestedQuestions,
    );
  }
}

/// Rule-based AI tutor — contextual coaching without a live LLM.
class AiTutorEngine {
  const AiTutorEngine._();

  static String openingMessage(AiTutorContext ctx, AppLocalizations l10n) {
    if (ctx.isHomePreview) {
      return l10n.aiTutorOpeningHome;
    }
    if (ctx.wrongRationales.isEmpty) {
      return l10n.aiTutorOpeningPerfect(ctx.scorePercent, ctx.domainName);
    }
    return l10n.aiTutorOpeningWithMistakes(
      ctx.scorePercent,
      ctx.wrongRationales.length,
      ctx.domainName,
    );
  }

  static List<String> quickPrompts(AiTutorContext ctx, AppLocalizations l10n) {
    final prompts = <String>[
      l10n.aiTutorQuickWrongAnswer,
      l10n.aiTutorQuickDocumentation,
      l10n.aiTutorQuickPatientTalk,
    ];
    if (ctx.weakPhaseLabels.isNotEmpty) {
      prompts.add(l10n.aiTutorQuickWeakPhase(ctx.weakPhaseLabels.first));
    }
    prompts.addAll(ctx.suggestedQuestions.take(2));
    return prompts;
  }

  static Future<String> respond({
    required String userMessage,
    required AiTutorContext ctx,
    required AppLocalizations l10n,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 700));
    final msg = userMessage.toLowerCase();

    if (_matches(msg, ['wrong', 'incorrect', 'mistake', 'fehler', 'falsch'])) {
      if (ctx.wrongRationales.isEmpty) {
        return l10n.aiTutorNoMistakes;
      }
      final buffer = StringBuffer('${l10n.aiTutorWrongIntro}\n\n');
      for (var i = 0; i < ctx.wrongRationales.length; i++) {
        buffer.writeln('${i + 1}. ${ctx.wrongRationales[i]}');
      }
      return buffer.toString().trim();
    }

    if (_matches(msg, ['document', 'chart', 'note', 'doku', 'dokument'])) {
      return l10n.aiTutorDocumentationAdvice;
    }

    if (_matches(msg, ['patient', 'explain', 'expect', 'erklär', 'patient'])) {
      return l10n.aiTutorPatientAdvice(ctx.patientName, ctx.domainName);
    }

    if (_matches(msg, ['follow', 'follow-up', 'review', 'nachsorge'])) {
      return l10n.aiTutorFollowUpAdvice;
    }

    if (_matches(msg, ['contra', 'safety', 'red flag', 'ausschluss', 'sicher'])) {
      return l10n.aiTutorSafetyAdvice;
    }

    if (_matches(msg, ['prescrib', 'verordn', 'diga', 'app', 'programme'])) {
      return l10n.aiTutorPrescribeAdvice(ctx.domainName);
    }

    if (_matches(msg, ['diagnos', 'indication', 'indikation'])) {
      return l10n.aiTutorDiagnoseAdvice;
    }

    if (ctx.weakPhaseLabels.isNotEmpty &&
        ctx.weakPhaseLabels.any((w) => msg.contains(w.toLowerCase().split(' ').first))) {
      return l10n.aiTutorWeakPhaseAdvice(ctx.weakPhaseLabels.join(', '));
    }

    if (ctx.wrongRationales.isNotEmpty && msg.length > 12) {
      return '${l10n.aiTutorFallbackWithHint}\n\n${ctx.wrongRationales.first}';
    }

    return l10n.aiTutorFallback;
  }

  static bool _matches(String msg, List<String> keywords) {
    return keywords.any((k) => msg.contains(k));
  }
}

/// Result of documentation coach analysis.
class DocumentationCoachResult {
  const DocumentationCoachResult({
    required this.scorePercent,
    required this.items,
    required this.feedback,
  });

  final int scorePercent;
  final List<({String label, bool met})> items;
  final String feedback;
}

/// Scores a free-text chart note against a DiGA documentation checklist.
class DocumentationCoachEngine {
  const DocumentationCoachEngine._();

  static DocumentationCoachResult analyse(String draft, AppLocalizations l10n) {
    final text = draft.toLowerCase();
    final items = <({String label, bool met})>[
      (label: l10n.aiDocCheckDiagnosis, met: _hasAny(text, ['diagnos', 'icd', 'f32', 'f51', 'm54', 'depress', 'insomn', 'hyperten', 'tinnitus', 'diabetes', 'incontinen'])),
      (label: l10n.aiDocCheckIndication, met: _hasAny(text, ['indicat', 'eligible', 'criteria', 'indikation', 'geeignet'])),
      (label: l10n.aiDocCheckRationale, met: _hasAny(text, ['rationale', 'because', 'reason', 'begründ', 'grund', 'chosen', 'selected'])),
      (label: l10n.aiDocCheckGoals, met: _hasAny(text, ['goal', 'target', 'ziel', 'outcome', 'improve', 'reduce'])),
      (label: l10n.aiDocCheckFollowUp, met: _hasAny(text, ['follow', 'review', 'week', 'month', 'nachsorge', 'kontrolle', 'termin'])),
      (label: l10n.aiDocCheckSafety, met: _hasAny(text, ['contra', 'exclude', 'red flag', 'safety', 'ausschluss', 'risiko', 'warn'])),
    ];

    final met = items.where((e) => e.met).length;
    final score = items.isEmpty ? 0 : ((met / items.length) * 100).round();

    final feedback = switch (score) {
      >= 85 => l10n.aiDocFeedbackExcellent,
      >= 60 => l10n.aiDocFeedbackGood,
      >= 35 => l10n.aiDocFeedbackPartial,
      _ => l10n.aiDocFeedbackNeedsWork,
    };

    return DocumentationCoachResult(scorePercent: score, items: items, feedback: feedback);
  }

  static bool _hasAny(String text, List<String> keywords) {
    return keywords.any(text.contains);
  }
}
