import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/bootstrap.dart';
import 'app/diga_lab_app.dart';

Future<void> main() async {
  await bootstrapFirebase();
  runApp(const ProviderScope(child: DigaLabApp()));
}
