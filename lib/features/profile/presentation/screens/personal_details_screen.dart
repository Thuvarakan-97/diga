import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/auth/presentation/providers/auth_providers.dart';
import 'package:diga/features/profile/presentation/providers/profile_settings_provider.dart';
import 'package:diga/features/profile/presentation/widgets/profile_subpage_scaffold.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/settings_section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalDetailsScreen extends ConsumerStatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  ConsumerState<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends ConsumerState<PersonalDetailsScreen> {
  final _nameController = TextEditingController();
  final _specialtyController = TextEditingController();
  final _institutionController = TextEditingController();
  final _licenseController = TextEditingController();
  bool _hydrated = false;

  @override
  void dispose() {
    _nameController.dispose();
    _specialtyController.dispose();
    _institutionController.dispose();
    _licenseController.dispose();
    super.dispose();
  }

  void _hydrateIfNeeded(PersonalDetailsDraft draft) {
    if (_hydrated) return;
    _nameController.text = draft.displayName;
    _specialtyController.text = draft.specialty;
    _institutionController.text = draft.institution;
    _licenseController.text = draft.licenseNumber;
    _hydrated = true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user = ref.watch(firebaseAuthStateProvider).valueOrNull;
    final demo = ref.watch(demoModeProvider);
    final draft = ref.watch(personalDetailsProvider);

    if (!_hydrated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final name = user?.displayName?.trim().isNotEmpty == true
            ? user!.displayName!.trim()
            : (demo ? l10n.profileDemoDisplayName : l10n.homeDoctorFallback);
        ref.read(personalDetailsProvider.notifier).hydrate(
              displayName: name,
              email: user?.email ?? l10n.profilePersonalEmailDemo,
              specialty: l10n.profilePersonalSpecialtyDefault,
            );
      });
    }

    _hydrateIfNeeded(draft);

    return ProfileSubpageScaffold(
      title: l10n.profileTilePersonalDetails,
      subtitle: l10n.profilePersonalSubtitle,
      children: [
        SettingsSectionCard(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: l10n.profilePersonalNameLabel,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: ref.read(personalDetailsProvider.notifier).updateDisplayName,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: l10n.authEmailLabel,
                      hintText: draft.email,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextField(
                    controller: _specialtyController,
                    decoration: InputDecoration(
                      labelText: l10n.profilePersonalSpecialtyLabel,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: ref.read(personalDetailsProvider.notifier).updateSpecialty,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextField(
                    controller: _institutionController,
                    decoration: InputDecoration(
                      labelText: l10n.profilePersonalInstitutionLabel,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: ref.read(personalDetailsProvider.notifier).updateInstitution,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextField(
                    controller: _licenseController,
                    decoration: InputDecoration(
                      labelText: l10n.profilePersonalLicenseLabel,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: ref.read(personalDetailsProvider.notifier).updateLicenseNumber,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        FilledButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.profilePersonalSavedSnack),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          child: Text(l10n.profilePersonalSaveCta),
        ),
      ],
    );
  }
}
