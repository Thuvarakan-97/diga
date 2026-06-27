import 'package:diga/core/locale/app_locale_provider.dart';
import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';
import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/features/simulation/presentation/data/banks/cvs_supplementary.dart';
import 'package:diga/features/simulation/presentation/data/banks/meta_supplementary.dart';
import 'package:diga/features/simulation/presentation/data/banks/msk_supplementary.dart';
import 'package:diga/features/simulation/presentation/data/banks/neuro_supplementary.dart';
import 'package:diga/features/simulation/presentation/data/banks/uro_supplementary.dart';
import 'package:diga/features/simulation/presentation/data/clinical_scenarios_data.dart';
import 'package:diga/features/simulation/presentation/data/simulation_question_factory.dart';

/// Builds a small exam set (5 questions) — legacy scenarios first, no bulk supplementary load.
abstract final class DomainQuestionBanks {
  static final _cache = <String, List<SimulationQuestion>>{};

  static List<SimulationQuestion> forModule(String moduleId, AppLanguage language) =>
      forDomain(ClinicalDomainData.mapModuleToDomain(moduleId), language);

  static List<SimulationQuestion> forDomain(String domainId, AppLanguage language) {
    final cacheKey = '${domainId}_${language.code}_v2';
    return _cache.putIfAbsent(cacheKey, () => _buildDomain(domainId, language));
  }

  static List<SimulationQuestion> _buildDomain(String domainId, AppLanguage language) {
    return switch (domainId) {
      'mental' => _fromLegacyOnly(language, [
        ClinicalScenariosData.depressionTrack,
        ClinicalScenariosData.insomniaTrack,
      ]),
      'msk' => _fromLegacyThenSupplementary(
        language,
        [ClinicalScenariosData.viviraTrack],
        MskSupplementary.builders,
      ),
      'neuro' => _fromLegacyThenSupplementary(
        language,
        [ClinicalScenariosData.kalmedaTrack],
        NeuroSupplementary.builders,
      ),
      'cvs' => _fromLegacyThenSupplementary(
        language,
        [ClinicalScenariosData.cardioTrack],
        CvsSupplementary.builders,
      ),
      'uro' => _fromSupplementaryOnly(language, UroSupplementary.builders),
      'meta' => _fromSupplementaryOnly(language, MetaSupplementary.builders),
      _ => _fromLegacyOnly(language, [
          ClinicalScenariosData.depressionTrack,
          ClinicalScenariosData.insomniaTrack,
        ]),
    };
  }

  static List<SimulationQuestion> _fromLegacyOnly(
    AppLanguage language,
    List<List<SimulationQuestion> Function(AppLanguage)> tracks,
  ) =>
      _fillUpToExamSize(language, legacyTracks: tracks);

  static List<SimulationQuestion> _fromLegacyThenSupplementary(
    AppLanguage language,
    List<List<SimulationQuestion> Function(AppLanguage)> tracks,
    List<SimulationQuestion Function(AppLanguage)> supplementary,
  ) =>
      _fillUpToExamSize(
        language,
        legacyTracks: tracks,
        supplementaryBuilders: supplementary,
      );

  static List<SimulationQuestion> _fromSupplementaryOnly(
    AppLanguage language,
    List<SimulationQuestion Function(AppLanguage)> supplementary,
  ) =>
      _fillUpToExamSize(language, supplementaryBuilders: supplementary);

  /// Only materialises up to [SimulationQuestionFactory.questionsPerExam] questions.
  static List<SimulationQuestion> _fillUpToExamSize(
    AppLanguage language, {
    List<List<SimulationQuestion> Function(AppLanguage)> legacyTracks = const [],
    List<SimulationQuestion Function(AppLanguage)> supplementaryBuilders = const [],
  }) {
    final limit = SimulationQuestionFactory.questionsPerExam;
    final result = <SimulationQuestion>[];

    for (final track in legacyTracks) {
      if (result.length >= limit) break;
      for (final question in track(language)) {
        result.add(question);
        if (result.length >= limit) break;
      }
    }

    for (final builder in supplementaryBuilders) {
      if (result.length >= limit) break;
      result.add(builder(language));
    }

    assert(result.isNotEmpty, 'Exam question bank must not be empty');
    return result;
  }
}
