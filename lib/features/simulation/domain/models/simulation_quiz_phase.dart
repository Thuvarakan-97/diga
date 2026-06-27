import 'package:diga/l10n/app_localizations.dart';

enum SimulationQuizPhase { diagnose, prescribe, followUp }

extension SimulationQuizPhaseLabels on SimulationQuizPhase {
  String displayLabel(AppLocalizations l10n) => switch (this) {
        SimulationQuizPhase.diagnose => l10n.quizPhaseDiagnoseShort,
        SimulationQuizPhase.prescribe => l10n.quizPhasePrescribeShort,
        SimulationQuizPhase.followUp => l10n.quizPhaseFollowUpShort,
      };
}
