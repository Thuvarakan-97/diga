import 'package:diga/core/locale/app_locale_provider.dart';
import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart';
import 'package:diga/features/simulation/presentation/data/localized_string.dart';

/// Builds [SimulationQuestion] instances from full or compact bilingual specs.
abstract final class SimulationQuestionFactory {
  /// Questions shown per domain exam (instant load — legacy scenarios first).
  static const questionsPerExam = 5;

  static SimulationQuestion build({
    required String id,
    required SimulationQuizPhase phase,
    required int correctIndex,
    required L10nStr title,
    required L10nStr vignette,
    required L10nStr decisionPoint,
    required L10nStr prompt,
    required List<L10nStr> options,
    required L10nStr rationale,
    L10nStr? teachingPearl,
    required AppLanguage language,
  }) {
    return SimulationQuestion(
      id: id,
      phase: phase,
      correctIndex: correctIndex,
      scenarioTitle: title.forLanguage(language),
      vignette: vignette.forLanguage(language),
      decisionPoint: decisionPoint.forLanguage(language),
      prompt: prompt.forLanguage(language),
      options: localizedOptions(language, options),
      rationale: rationale.forLanguage(language),
      teachingPearl: teachingPearl?.forLanguage(language),
    );
  }

  /// Shorthand for compact bilingual tuples `(en, de)`.
  static SimulationQuestion fromPairs({
    required String id,
    required SimulationQuizPhase phase,
    required int correctIndex,
    required AppLanguage language,
    required (String, String) title,
    required (String, String) vignette,
    required (String, String) decisionPoint,
    required (String, String) prompt,
    required List<(String, String)> options,
    required (String, String) rationale,
    (String, String)? teachingPearl,
  }) {
    return build(
      id: id,
      phase: phase,
      correctIndex: correctIndex,
      language: language,
      title: L10nStr(title.$1, title.$2),
      vignette: L10nStr(vignette.$1, vignette.$2),
      decisionPoint: L10nStr(decisionPoint.$1, decisionPoint.$2),
      prompt: L10nStr(prompt.$1, prompt.$2),
      options: options.map((o) => L10nStr(o.$1, o.$2)).toList(growable: false),
      rationale: L10nStr(rationale.$1, rationale.$2),
      teachingPearl: teachingPearl == null ? null : L10nStr(teachingPearl.$1, teachingPearl.$2),
    );
  }

  static List<SimulationQuestion> buildAll(
    AppLanguage language,
    List<SimulationQuestion Function(AppLanguage)> builders,
  ) =>
      builders.map((b) => b(language)).toList(growable: false);
}
