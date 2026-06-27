import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../models/clinical_domain_data.dart';
import '../providers/scenario_progress_provider.dart';

class ModuleDetailScreen extends ConsumerWidget {
  const ModuleDetailScreen({super.key, required this.moduleId});

  final String moduleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final domain = ClinicalDomainData.byId(ClinicalDomainData.mapModuleToDomain(moduleId));
    ref.watch(scenarioProgressProvider);
    final progress = ref.read(scenarioProgressProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(domain.name),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          Text(
            domain.countLabel,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Theme.of(context).dividerColor.withValues(alpha: 0.4)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(domain.icon, color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    domain.heroDescription,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Scenarios',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            'Each scenario starts a domain exam with 5 clinical questions.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 10),
          for (var i = 0; i < domain.scenarios.length; i++) ...[
            Builder(
              builder: (context) {
                final scenario = domain.scenarios[i];
                final locked = progress.isScenarioLocked(domain, i);
                final done = progress.isCompleted(scenario.id);
                return _ScenarioTile(
                  scenario: scenario,
                  locked: locked,
                  done: done,
                  onTap: locked
                      ? null
                      : () => context.push(
                            AppRoutes.simulationDiagnose(
                              scenario.moduleId,
                              scenarioId: scenario.id,
                            ),
                          ),
                );
              },
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _ScenarioTile extends StatelessWidget {
  const _ScenarioTile({
    required this.scenario,
    required this.locked,
    required this.done,
    this.onTap,
  });

  final ClinicalScenarioItem scenario;
  final bool locked;
  final bool done;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: locked ? 0.5 : 1,
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).dividerColor.withValues(alpha: 0.35)),
          borderRadius: BorderRadius.circular(14),
        ),
        leading: CircleAvatar(
          radius: 14,
          backgroundColor: done ? Theme.of(context).colorScheme.primaryContainer : null,
          child: Icon(
            done ? Icons.check_rounded : Icons.circle_outlined,
            size: 16,
            color: done ? Theme.of(context).colorScheme.primary : null,
          ),
        ),
        title: Text(
          scenario.title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        subtitle: Text('${scenario.tag} · ${scenario.meta}${locked ? '  🔒' : ''}'),
        trailing: Icon(locked ? Icons.lock_outline_rounded : Icons.chevron_right_rounded),
        onTap: onTap,
      ),
    );
  }
}
