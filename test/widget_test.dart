import 'package:diga/app/diga_lab_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DiGA LAB boots into splash', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: DigaLabApp()));
    await tester.pump();

    expect(find.textContaining('DiGA LAB'), findsWidgets);

    // Drain splash delay so no timers remain after the test disposes the tree.
    await tester.pump(const Duration(milliseconds: 1000));
  });
}
