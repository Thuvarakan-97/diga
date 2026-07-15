import 'package:diga/features/simulation/presentation/providers/simulation_quiz_provider.dart';
import 'package:diga/l10n/app_localizations.dart';

/// Personalized AI coaching report built from a completed exam attempt.
class ExamAiLearningReport {
  const ExamAiLearningReport({
    required this.moduleId,
    required this.scorePercent,
    required this.summary,
    required this.weakPhases,
    required this.focusItems,
    required this.teachingTips,
    required this.nextSteps,
  });

  final String moduleId;
  final int scorePercent;
  final String summary;
  final List<String> weakPhases;
  final List<ExamAiFocusItem> focusItems;
  final List<String> teachingTips;
  final List<String> nextSteps;
}

class ExamAiFocusItem {
  const ExamAiFocusItem({
    required this.phaseLabel,
    required this.prompt,
    required this.rationale,
  });

  final String phaseLabel;
  final String prompt;
  final String rationale;
}

/// Builds an offline AI-style learning report from live quiz answers (no LLM required).
class ExamAiReportBuilder {
  const ExamAiReportBuilder._();

  static ExamAiLearningReport build({
    required SimulationQuizState quiz,
    required AppLocalizations l10n,
  }) {
    final wrong = <ExamAiFocusItem>[];
    final phaseMisses = <SimulationQuizPhase, int>{};
    final phaseTotals = <SimulationQuizPhase, int>{};

    for (final q in quiz.questions) {
      phaseTotals[q.phase] = (phaseTotals[q.phase] ?? 0) + 1;
      final selected = quiz.answers[q.id];
      final isCorrect = selected != null && q.isCorrect(selected);
      if (!isCorrect) {
        phaseMisses[q.phase] = (phaseMisses[q.phase] ?? 0) + 1;
        if (wrong.length < 3) {
          wrong.add(
            ExamAiFocusItem(
              phaseLabel: q.phase.displayLabel(l10n),
              prompt: q.prompt,
              rationale: q.rationale,
            ),
          );
        }
      }
    }

    final weakPhases = <String>[];
    for (final phase in SimulationQuizPhase.values) {
      final total = phaseTotals[phase] ?? 0;
      if (total == 0) continue;
      final misses = phaseMisses[phase] ?? 0;
      final pct = ((total - misses) / total * 100).round();
      if (pct < 70) {
        weakPhases.add('${phase.displayLabel(l10n)} ($pct%)');
      }
    }
    if (weakPhases.isEmpty && quiz.scorePercent < 100) {
      weakPhases.add(l10n.aiReportWeakPhaseGeneral);
    }

    final tips = <String>[];
    if (wrong.isEmpty) {
      tips.addAll([
        l10n.aiReportTipPerfect1,
        l10n.aiReportTipPerfect2,
      ]);
    } else {
      tips.add(l10n.aiReportTipReviewWrong);
      if (phaseMisses.containsKey(SimulationQuizPhase.diagnose)) {
        tips.add(l10n.aiReportTipDiagnose);
      }
      if (phaseMisses.containsKey(SimulationQuizPhase.prescribe)) {
        tips.add(l10n.aiReportTipPrescribe);
      }
      if (phaseMisses.containsKey(SimulationQuizPhase.followUp)) {
        tips.add(l10n.aiReportTipFollowUp);
      }
      tips.add(l10n.aiReportTipDocumentation);
    }

    final nextSteps = <String>[
      if (quiz.scorePercent < 60) l10n.aiReportNextRetry,
      if (quiz.scorePercent >= 60 && wrong.isNotEmpty) l10n.aiReportNextReviewCompanion,
      l10n.aiReportNextContinueScenarios,
    ];

    return ExamAiLearningReport(
      moduleId: quiz.moduleId,
      scorePercent: quiz.scorePercent,
      summary: _summary(quiz.scorePercent, wrong.length, l10n),
      weakPhases: weakPhases,
      focusItems: wrong,
      teachingTips: tips.take(4).toList(),
      nextSteps: nextSteps,
    );
  }

  static String _summary(int score, int wrongCount, AppLocalizations l10n) {
    if (score >= 90) return l10n.aiReportSummaryExcellent(score);
    if (score >= 60) return l10n.aiReportSummaryPassed(score, wrongCount);
    return l10n.aiReportSummaryFailed(score, wrongCount);
  }
}
