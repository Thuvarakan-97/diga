import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Bottom navigation host for the five main sections (indexed stack).
class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.pageHorizontal,
          0,
          AppSpacing.pageHorizontal,
          AppSpacing.md + 2,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadii.xl),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.12),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
              const BoxShadow(
                color: Color(0x14000000),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadii.xl),
            child: NavigationBarTheme(
              data: NavigationBarTheme.of(context).copyWith(
                height: 68,
                labelTextStyle: WidgetStateProperty.resolveWith((states) {
                  final selected = states.contains(WidgetState.selected);
                  return TextStyle(
                    fontSize: 11.5,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    letterSpacing: selected ? -0.1 : 0,
                  );
                }),
              ),
              child: NavigationBar(
                selectedIndex: navigationShell.currentIndex,
                onDestinationSelected: _onDestinationSelected,
                destinations: [
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined, color: _iconColor(context, 0)),
                    selectedIcon: const Icon(Icons.home_rounded),
                    label: l10n.navHome,
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.menu_book_outlined, color: _iconColor(context, 1)),
                    selectedIcon: const Icon(Icons.menu_book_rounded),
                    label: l10n.navModules,
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.description_outlined, color: _iconColor(context, 2)),
                    selectedIcon: const Icon(Icons.description_rounded),
                    label: l10n.navCompanion,
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.insights_outlined, color: _iconColor(context, 3)),
                    selectedIcon: const Icon(Icons.insights_rounded),
                    label: l10n.navProgress,
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_outline_rounded, color: _iconColor(context, 4)),
                    selectedIcon: const Icon(Icons.person_rounded),
                    label: l10n.navProfile,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color? _iconColor(BuildContext context, int index) {
    if (navigationShell.currentIndex == index) return null;
    return AppColors.textMuted.withValues(alpha: 0.9);
  }
}
