import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/auth/presentation/providers/auth_providers.dart';
import 'package:diga/features/profile/presentation/providers/profile_settings_provider.dart';
import 'package:diga/features/profile/presentation/widgets/profile_subpage_scaffold.dart';
import 'package:diga/l10n/app_localizations.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/models/user_profile.dart';
import 'package:diga/shared/widgets/settings_section_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalDetailsScreen extends ConsumerStatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  ConsumerState<PersonalDetailsScreen> createState() =>
      _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends ConsumerState<PersonalDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _specialtyController = TextEditingController();
  final _institutionController = TextEditingController();
  final _licenseController = TextEditingController();
  bool _loading = true;
  bool _loadingRequested = false;
  bool _loadFailed = false;
  bool _saving = false;
  bool _loaded = false;
  String? _loadErrorMessage;

  String _profileErrorMessage(
    Object error,
    String fallback,
    AppLocalizations l10n,
  ) {
    if (error is FirebaseException) {
      switch (error.code) {
        case 'permission-denied':
          return l10n.profileFirebasePermissionError;
        case 'failed-precondition':
          return l10n.profileFirebaseDatabaseError;
        case 'unavailable':
          return l10n.profileFirebaseNetworkError;
        default:
          debugPrint(
            'Profile Firestore error (${error.code}): ${error.message}',
          );
      }
    }
    return fallback;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _specialtyController.dispose();
    _institutionController.dispose();
    _licenseController.dispose();
    super.dispose();
  }

  void _scheduleLoad(User? user, bool demo) {
    if (_loadingRequested ||
        _loaded ||
        _loadFailed ||
        (user == null && !demo)) {
      return;
    }
    _loadingRequested = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _loadProfile(user, demo);
    });
  }

  Future<void> _loadProfile(User? user, bool demo) async {
    UserProfile? profile;
    var profileLoadFailed = false;
    final l10n = context.l10n;
    try {
      if (user != null) {
        profile = await ref
            .read(authRepositoryProvider)
            .getCurrentUserProfile();
      }
    } catch (error, stackTrace) {
      debugPrint(
        'Profile: failed to load personal details: $error\n$stackTrace',
      );
      profileLoadFailed = true;
      _loadErrorMessage = _profileErrorMessage(
        error,
        l10n.profilePersonalLoadError,
        l10n,
      );
    } finally {
      _loadingRequested = false;
    }
    if (!mounted) return;

    final name = profile?.displayName?.trim().isNotEmpty == true
        ? profile!.displayName!.trim()
        : (user?.displayName?.trim().isNotEmpty == true
              ? user!.displayName!.trim()
              : (demo ? l10n.profileDemoDisplayName : l10n.homeDoctorFallback));
    final email = profile?.email.isNotEmpty == true
        ? profile!.email
        : (user?.email ?? l10n.profilePersonalEmailDemo);
    final specialty = profile?.medicalSpecialty?.trim().isNotEmpty == true
        ? profile!.medicalSpecialty!.trim()
        : l10n.profilePersonalSpecialtyDefault;
    final institution = profile?.institution ?? '';
    final license = profile?.licenseNumber ?? '';

    _nameController.text = name;
    _emailController.text = email;
    _specialtyController.text = specialty;
    _institutionController.text = institution;
    _licenseController.text = license;
    ref
        .read(personalDetailsProvider.notifier)
        .hydrate(
          displayName: name,
          email: email,
          specialty: specialty,
          institution: institution,
          licenseNumber: license,
        );
    setState(() {
      _loaded = true;
      _loading = false;
      _loadFailed = profileLoadFailed;
      if (!profileLoadFailed) _loadErrorMessage = null;
    });
  }

  Future<void> _retryLoad(User? user, bool demo) async {
    setState(() {
      _loading = true;
      _loadFailed = false;
      _loadingRequested = true;
    });
    await _loadProfile(user, demo);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      await ref
          .read(authRepositoryProvider)
          .updateCurrentUserProfile(
            displayName: _nameController.text,
            medicalSpecialty: _specialtyController.text,
            institution: _institutionController.text,
            licenseNumber: _licenseController.text,
          );
      ref
          .read(personalDetailsProvider.notifier)
          .hydrate(
            displayName: _nameController.text.trim(),
            email: _emailController.text,
            specialty: _specialtyController.text.trim(),
            institution: _institutionController.text.trim(),
            licenseNumber: _licenseController.text.trim(),
          );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.profilePersonalSavedSnack),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (error, stackTrace) {
      debugPrint(
        'Profile: failed to save personal details: $error\n$stackTrace',
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _profileErrorMessage(
                error,
                context.l10n.profilePersonalSaveError,
                context.l10n,
              ),
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user = ref.watch(firebaseAuthStateProvider).valueOrNull;
    final demo = ref.watch(demoModeProvider);
    _scheduleLoad(user, demo);

    return ProfileSubpageScaffold(
      title: l10n.profileTilePersonalDetails,
      subtitle: l10n.profilePersonalSubtitle,
      children: [
        if (_loading)
          const Padding(
            padding: EdgeInsets.all(AppSpacing.xxl),
            child: Center(child: CircularProgressIndicator()),
          )
        else ...[
          if (_loadFailed) ...[
            SettingsSectionCard(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    children: [
                      Text(
                        _loadErrorMessage ?? l10n.profilePersonalLoadError,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      OutlinedButton(
                        onPressed: () => _retryLoad(user, demo),
                        child: Text(l10n.profilePersonalRetryCta),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
          ],
          SettingsSectionCard(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: l10n.profilePersonalNameLabel,
                          border: const OutlineInputBorder(),
                        ),
                        textCapitalization: TextCapitalization.words,
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                            ? l10n.profilePersonalNameRequired
                            : null,
                        onChanged: ref
                            .read(personalDetailsProvider.notifier)
                            .updateDisplayName,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      TextField(
                        controller: _emailController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: l10n.authEmailLabel,
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
                        textCapitalization: TextCapitalization.words,
                        onChanged: ref
                            .read(personalDetailsProvider.notifier)
                            .updateSpecialty,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      TextField(
                        controller: _institutionController,
                        decoration: InputDecoration(
                          labelText: l10n.profilePersonalInstitutionLabel,
                          border: const OutlineInputBorder(),
                        ),
                        textCapitalization: TextCapitalization.words,
                        onChanged: ref
                            .read(personalDetailsProvider.notifier)
                            .updateInstitution,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      TextField(
                        controller: _licenseController,
                        decoration: InputDecoration(
                          labelText: l10n.profilePersonalLicenseLabel,
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: ref
                            .read(personalDetailsProvider.notifier)
                            .updateLicenseNumber,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton(
            onPressed: _saving ? null : _save,
            child: _saving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(l10n.profilePersonalSaveCta),
          ),
        ],
      ],
    );
  }
}
