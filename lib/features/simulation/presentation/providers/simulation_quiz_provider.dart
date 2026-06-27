import 'package:diga/core/locale/app_locale_provider.dart';
import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart'; // displayLabel extension
import 'package:diga/features/simulation/presentation/data/domain_question_banks.dart';
import 'package:diga/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart';

class SimulationQuizState {
  const SimulationQuizState({
    required this.moduleId,
    required this.questions,
    this.answers = const {},
    this.currentQuestionIndex = 0,
  });

  final String moduleId;
  final List<SimulationQuestion> questions;
  final Map<String, int> answers;
  final int currentQuestionIndex;

  int get totalQuestions => questions.length;

  SimulationQuestion get currentQuestion {
    if (questions.isEmpty) {
      throw StateError('No questions loaded for exam');
    }
    final index = currentQuestionIndex.clamp(0, questions.length - 1);
    return questions[index];
  }

  bool get isFirstQuestion => currentQuestionIndex <= 0;

  bool get isLastQuestion => totalQuestions <= 1 || currentQuestionIndex >= totalQuestions - 1;

  bool get currentAnswered => answers.containsKey(currentQuestion.id);

  bool get allAnswered => answers.length == totalQuestions && totalQuestions > 0;

  int get answeredCount => answers.length;

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

  Map<String, int> phaseBreakdownFor(AppLocalizations l10n) {
    final totals = <SimulationQuizPhase, ({int correct, int total})>{};
    for (final q in questions) {
      final bucket = totals[q.phase] ?? (correct: 0, total: 0);
      final selected = answers[q.id];
      final isCorrect = selected != null && q.isCorrect(selected);
      totals[q.phase] = (
        correct: bucket.correct + (isCorrect ? 1 : 0),
        total: bucket.total + 1,
      );
    }
    return {
      for (final entry in totals.entries)
        entry.key.displayLabel(l10n):
            entry.value.total == 0 ? 0 : ((entry.value.correct / entry.value.total) * 100).round(),
    };
  }

  SimulationQuizState copyWith({
    List<SimulationQuestion>? questions,
    Map<String, int>? answers,
    int? currentQuestionIndex,
  }) {
    return SimulationQuizState(
      moduleId: moduleId,
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    );
  }
}

class SimulationQuizController extends StateNotifier<SimulationQuizState> {
  SimulationQuizController({required String moduleId, required AppLanguage language})
      : _language = language,
        super(
          SimulationQuizState(
            moduleId: moduleId,
            questions: DomainQuestionBanks.forModule(moduleId, language),
          ),
        );

  final AppLanguage _language;

  void reset() {
    state = SimulationQuizState(
      moduleId: state.moduleId,
      questions: DomainQuestionBanks.forModule(state.moduleId, _language),
      answers: const {},
      currentQuestionIndex: 0,
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

  void goToQuestion(int index) {
    if (index < 0 || index >= state.totalQuestions) return;
    state = state.copyWith(currentQuestionIndex: index);
  }

  void nextQuestion() {
    if (!state.isLastQuestion) {
      goToQuestion(state.currentQuestionIndex + 1);
    }
  }

  void previousQuestion() {
    if (!state.isFirstQuestion) {
      goToQuestion(state.currentQuestionIndex - 1);
    }
  }
}

final simulationQuizControllerProvider =
    StateNotifierProvider.family<SimulationQuizController, SimulationQuizState, String>(
  (ref, moduleId) {
    final language = ref.read(appLanguageProvider);
    return SimulationQuizController(moduleId: moduleId, language: language);
  },
);

/// Keeps quiz answers alive for the result screen after the exam route is popped.
final simulationQuizResultCacheProvider =
    StateProvider.family<SimulationQuizState?, String>((ref, moduleId) => null);
