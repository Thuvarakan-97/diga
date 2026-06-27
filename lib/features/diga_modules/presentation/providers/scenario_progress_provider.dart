import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScenarioProgressState {
  const ScenarioProgressState({this.completedScenarioIds = const {}});

  final Set<String> completedScenarioIds;
}

class ScenarioProgressController extends StateNotifier<ScenarioProgressState> {
  ScenarioProgressController() : super(const ScenarioProgressState());

  bool isCompleted(String scenarioId) => state.completedScenarioIds.contains(scenarioId);

  void completeScenario(String scenarioId) {
    if (isCompleted(scenarioId)) return;
    state = ScenarioProgressState(
      completedScenarioIds: {...state.completedScenarioIds, scenarioId},
    );
  }

  /// Scenario [index] in [domain] is playable when all prior scenarios in the path are done.
  bool isScenarioLocked(ClinicalDomain domain, int index) {
    if (index < 0 || index >= domain.scenarios.length) return true;

    final domainIndex = ClinicalDomainData.domainOrder.indexOf(domain.id);
    if (index == 0) {
      if (domainIndex <= 0) return false;
      final previousDomain = ClinicalDomainData.byId(ClinicalDomainData.domainOrder[domainIndex - 1]);
      final lastScenario = previousDomain.scenarios.last;
      return !isCompleted(lastScenario.id);
    }

    final previousInDomain = domain.scenarios[index - 1];
    return !isCompleted(previousInDomain.id);
  }

  /// First scenario in [domain] that is unlocked and not yet completed.
  ClinicalScenarioItem? nextPlayableInDomain(ClinicalDomain domain) {
    for (var i = 0; i < domain.scenarios.length; i++) {
      final scenario = domain.scenarios[i];
      if (!isScenarioLocked(domain, i) && !isCompleted(scenario.id)) {
        return scenario;
      }
    }
    return null;
  }
}

final scenarioProgressProvider =
    StateNotifierProvider<ScenarioProgressController, ScenarioProgressState>(
  (ref) => ScenarioProgressController(),
);

extension ScenarioProgressLookup on ScenarioProgressController {
  ClinicalScenarioItem? scenarioById(String scenarioId) {
    for (final domain in ClinicalDomainData.domains) {
      for (final scenario in domain.scenarios) {
        if (scenario.id == scenarioId) return scenario;
      }
    }
    return null;
  }

  /// Resolves which scenario was attempted when only [moduleId] is known.
  String? inferScenarioIdForModule(String moduleId) {
    final domain = ClinicalDomainData.domainForModule(moduleId);
    for (var i = 0; i < domain.scenarios.length; i++) {
      final scenario = domain.scenarios[i];
      if (scenario.moduleId == moduleId && !isScenarioLocked(domain, i) && !isCompleted(scenario.id)) {
        return scenario.id;
      }
    }
    for (var i = 0; i < domain.scenarios.length; i++) {
      final scenario = domain.scenarios[i];
      if (scenario.moduleId == moduleId && !isScenarioLocked(domain, i)) {
        return scenario.id;
      }
    }
    return domain.scenarios.isNotEmpty ? domain.scenarios.first.id : null;
  }
}
