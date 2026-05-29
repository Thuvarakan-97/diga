import 'package:diga/l10n/app_localizations.dart';

/// Parsed companion copy for one DiGA (educational mock — not live clinical guidance).
class CompanionReferenceData {
  const CompanionReferenceData({
    required this.icdRows,
    required this.eligibilityLines,
    required this.contraindicationLines,
    required this.documentationLines,
    required this.patientGuidanceParagraphs,
    required this.insuranceNotes,
  });

  final List<({String code, String label})> icdRows;
  final List<String> eligibilityLines;
  final List<String> contraindicationLines;
  final List<String> documentationLines;
  final List<String> patientGuidanceParagraphs;
  final String insuranceNotes;

  static CompanionReferenceData? forModule(String? moduleId, AppLocalizations l10n) {
    switch (moduleId) {
      case 'kalmeda':
        return CompanionReferenceData(
          icdRows: _parseIcdBlock(l10n.companionKalmedaIcdBlock),
          eligibilityLines: _lines(l10n.companionKalmedaEligibilityBlock),
          contraindicationLines: _lines(l10n.companionKalmedaContraBlock),
          documentationLines: _lines(l10n.companionKalmedaDocBlock),
          patientGuidanceParagraphs: _paragraphs(l10n.companionKalmedaPatientBlock),
          insuranceNotes: l10n.companionKalmedaInsuranceBlock,
        );
      case 'vivira':
        return CompanionReferenceData(
          icdRows: _parseIcdBlock(l10n.companionViviraIcdBlock),
          eligibilityLines: _lines(l10n.companionViviraEligibilityBlock),
          contraindicationLines: _lines(l10n.companionViviraContraBlock),
          documentationLines: _lines(l10n.companionViviraDocBlock),
          patientGuidanceParagraphs: _paragraphs(l10n.companionViviraPatientBlock),
          insuranceNotes: l10n.companionViviraInsuranceBlock,
        );
      default:
        return null;
    }
  }

  static List<({String code, String label})> _parseIcdBlock(String raw) {
    return raw
        .split('\n')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .map((line) {
          final sep = line.contains('—') ? '—' : (line.contains('–') ? '–' : '-');
          final parts = line.split(sep);
          if (parts.length < 2) return (code: line, label: '');
          return (code: parts.first.trim(), label: parts.sublist(1).join(sep).trim());
        })
        .toList();
  }

  static List<String> _lines(String raw) {
    return raw.split('\n').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
  }

  static List<String> _paragraphs(String raw) {
    return raw.split('\n\n').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
  }
}
