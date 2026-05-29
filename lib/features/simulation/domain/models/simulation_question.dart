import 'simulation_quiz_phase.dart';

/// Clinical MCQ used across simulation phases (Diagnose → Prescribe → Follow-up).
class SimulationQuestion {
  const SimulationQuestion({
    required this.id,
    required this.phase,
    required this.scenarioTitle,
    required this.vignette,
    required this.decisionPoint,
    required this.prompt,
    required this.options,
    required this.correctIndex,
    required this.rationale,
    this.teachingPearl,
  });

  final String id;
  final SimulationQuizPhase phase;
  final String scenarioTitle;
  final String vignette;
  final String decisionPoint;
  final String prompt;
  final List<String> options;
  final int correctIndex;
  final String rationale;
  final String? teachingPearl;

  bool isCorrect(int selectedIndex) => selectedIndex == correctIndex;
}
