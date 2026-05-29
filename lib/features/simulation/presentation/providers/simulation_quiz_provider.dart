import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart'; // displayLabel extension
import 'package:diga/features/simulation/presentation/data/clinical_scenarios_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart';

class SimulationQuizState {
  const SimulationQuizState({
    required this.moduleId,
    required this.questions,
    this.answers = const {},
  });

  final String moduleId;
  final List<SimulationQuestion> questions;
  final Map<String, int> answers;

  int get totalQuestions => questions.length;

  int get correctAnswers {
    var count = 0;
    for (final q in questions) {
      if (answers[q.id] == q.correctIndex) count++;
    }
    return count;
  }

  int get scorePercent {
    if (totalQuestions == 0) return 0;
    return ((correctAnswers / totalQuestions) * 100).round();
  }

  int get accuracyPercent => scorePercent;

  bool get isPerfectFirstAttempt => correctAnswers == totalQuestions && totalQuestions > 0;

  int? selectedFor(String questionId) => answers[questionId];

  SimulationQuestion questionFor(SimulationQuizPhase phase) {
    return questions.firstWhere((q) => q.phase == phase);
  }

  /// Per-phase score (100 = correct, 0 = incorrect/unanswered) for result breakdown.
  Map<String, int> get phaseBreakdown {
    final breakdown = <String, int>{};
    for (final q in questions) {
      final selected = answers[q.id];
      breakdown[q.phase.displayLabel] =
          selected != null && q.isCorrect(selected) ? 100 : 0;
    }
    return breakdown;
  }

  SimulationQuizState copyWith({
    List<SimulationQuestion>? questions,
    Map<String, int>? answers,
  }) {
    return SimulationQuizState(
      moduleId: moduleId,
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
    );
  }
}

class SimulationQuizController extends StateNotifier<SimulationQuizState> {
  SimulationQuizController({required String moduleId})
      : super(
          SimulationQuizState(
            moduleId: moduleId,
            questions: ClinicalScenariosData.forModule(moduleId),
          ),
        );

  void reset() {
    state = SimulationQuizState(
      moduleId: state.moduleId,
      questions: state.questions,
      answers: const {},
    );
  }

  void answerQuestion(String questionId, int selectedIndex) {
    state = state.copyWith(
      answers: {
        ...state.answers,
        questionId: selectedIndex,
      },
    );
  }
}

final simulationQuizControllerProvider =
    StateNotifierProvider.family<SimulationQuizController, SimulationQuizState, String>(
  (ref, moduleId) => SimulationQuizController(moduleId: moduleId),
);
