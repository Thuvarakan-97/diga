import 'dart:math' as math;

import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';
import 'package:diga/features/diga_modules/presentation/widgets/domain_visuals.dart';
import 'package:flutter/material.dart';

/// Fills the lower area of domain cards with a themed gradient illustration.
class DomainCoverIllustration extends StatelessWidget {
  const DomainCoverIllustration({
    super.key,
    required this.domain,
    this.height,
    this.borderRadius = const BorderRadius.vertical(bottom: Radius.circular(14)),
  });

  final ClinicalDomain domain;
  final double? height;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final visuals = DomainVisuals.forId(domain.id);

    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: visuals.gradient,
                ),
              ),
            ),
            CustomPaint(painter: _BlobPainter(glow: visuals.glow)),
            Positioned(
              right: -12,
              bottom: -16,
              child: Icon(
                domain.icon,
                size: 96,
                color: Colors.white.withValues(alpha: 0.18),
              ),
            ),
            Positioned(
              left: 14,
              bottom: 18,
              child: Icon(
                domain.icon,
                size: 36,
                color: Colors.white.withValues(alpha: 0.92),
              ),
            ),
            Positioned(
              left: 52,
              top: 16,
              child: _DotRing(color: visuals.accent.withValues(alpha: 0.35)),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.08),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.12),
                  ],
                  stops: const [0, 0.45, 1],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DotRing extends StatelessWidget {
  const _DotRing({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: CustomPaint(painter: _RingPainter(color: color)),
    );
  }
}

class _BlobPainter extends CustomPainter {
  _BlobPainter({required this.glow});

  final Color glow;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = glow.withValues(alpha: 0.22);

    canvas.drawCircle(Offset(size.width * 0.78, size.height * 0.28), size.width * 0.22, paint);
    canvas.drawCircle(Offset(size.width * 0.18, size.height * 0.62), size.width * 0.16, paint);

    final wave = Path()
      ..moveTo(0, size.height * 0.72)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.58, size.width * 0.5, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.78, size.height * 0.84, size.width, size.height * 0.68)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(
      wave,
      Paint()..color = Colors.white.withValues(alpha: 0.12),
    );
  }

  @override
  bool shouldRepaint(covariant _BlobPainter oldDelegate) => oldDelegate.glow != glow;
}

class _RingPainter extends CustomPainter {
  _RingPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(center, size.width * 0.38, paint);

    for (var i = 0; i < 6; i++) {
      final angle = (math.pi * 2 / 6) * i;
      final dx = center.dx + math.cos(angle) * size.width * 0.38;
      final dy = center.dy + math.sin(angle) * size.width * 0.38;
      canvas.drawCircle(Offset(dx, dy), 2.5, Paint()..color = color);
    }
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) => oldDelegate.color != color;
}
