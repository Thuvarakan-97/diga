enum SimulationQuizPhase { diagnose, prescribe, followUp }

extension SimulationQuizPhaseLabels on SimulationQuizPhase {
  String get displayLabel => switch (this) {
        SimulationQuizPhase.diagnose => 'Diagnose',
        SimulationQuizPhase.prescribe => 'Prescribe',
        SimulationQuizPhase.followUp => 'Follow-Up',
      };
}
