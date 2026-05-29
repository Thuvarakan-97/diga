import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';

class ModuleDetailScreen extends StatelessWidget {
  const ModuleDetailScreen({super.key, required this.moduleId});

  final String moduleId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.moduleDetailTitle(moduleId))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.moduleDetailPlaceholder),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.push(AppRoutes.simulationDiagnose(moduleId)),
              child: Text(l10n.moduleDetailStartSimulation),
            ),
          ],
        ),
      ),
    );
  }
}
