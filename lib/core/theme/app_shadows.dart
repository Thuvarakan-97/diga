import 'package:flutter/material.dart';

abstract final class AppShadows {
  static List<BoxShadow> cardSoft(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return [
      BoxShadow(
        color: isDark ? Colors.black26 : const Color(0x1A0D47A1),
        blurRadius: 20,
        offset: const Offset(0, 8),
        spreadRadius: -4,
      ),
      BoxShadow(
        color: isDark ? Colors.transparent : const Color(0x0D000000),
        blurRadius: 6,
        offset: const Offset(0, 2),
      ),
    ];
  }

  static List<BoxShadow> cardSubtle(BuildContext context) => [
        BoxShadow(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black38
              : const Color(0x14000000),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ];
}
