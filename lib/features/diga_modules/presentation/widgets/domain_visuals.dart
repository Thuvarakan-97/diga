import 'package:flutter/material.dart';

/// Per-domain accent palette for cover illustrations and cards.
class DomainVisuals {
  const DomainVisuals({
    required this.gradient,
    required this.accent,
    required this.glow,
  });

  final List<Color> gradient;
  final Color accent;
  final Color glow;

  static DomainVisuals forId(String id) => _byId[id] ?? _byId['mental']!;

  static const _byId = <String, DomainVisuals>{
    'mental': DomainVisuals(
      gradient: [Color(0xFF3949AB), Color(0xFF5C6BC0), Color(0xFF9FA8DA)],
      accent: Color(0xFFE8EAF6),
      glow: Color(0xFF7986CB),
    ),
    'msk': DomainVisuals(
      gradient: [Color(0xFF00695C), Color(0xFF00897B), Color(0xFF4DB6AC)],
      accent: Color(0xFFE0F2F1),
      glow: Color(0xFF26A69A),
    ),
    'uro': DomainVisuals(
      gradient: [Color(0xFF0277BD), Color(0xFF039BE5), Color(0xFF4FC3F7)],
      accent: Color(0xFFE1F5FE),
      glow: Color(0xFF29B6F6),
    ),
    'meta': DomainVisuals(
      gradient: [Color(0xFFEF6C00), Color(0xFFFF9800), Color(0xFFFFB74D)],
      accent: Color(0xFFFFF3E0),
      glow: Color(0xFFFFA726),
    ),
    'neuro': DomainVisuals(
      gradient: [Color(0xFF6A1B9A), Color(0xFF8E24AA), Color(0xFFBA68C8)],
      accent: Color(0xFFF3E5F5),
      glow: Color(0xFFAB47BC),
    ),
    'cvs': DomainVisuals(
      gradient: [Color(0xFFC62828), Color(0xFFE53935), Color(0xFFEF5350)],
      accent: Color(0xFFFFEBEE),
      glow: Color(0xFFEF5350),
    ),
  };
}
