import 'dart:math' as math;

import 'package:diga/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Pass threshold for showing the celebration overlay.
const examPassScoreThreshold = 60;

/// Pass / fail styling for the result banner.
enum ExamCelebrationVariant { passed, failed }

/// Falling confetti overlay when an exam finishes (pass or fail).
class ExamPassCelebration extends StatefulWidget {
  const ExamPassCelebration({
    super.key,
    required this.scorePercent,
    required this.message,
    this.variant = ExamCelebrationVariant.passed,
    this.onDismiss,
  });

  final int scorePercent;
  final String message;
  final ExamCelebrationVariant variant;
  final VoidCallback? onDismiss;

  @override
  State<ExamPassCelebration> createState() => _ExamPassCelebrationState();
}

class _ExamPassCelebrationState extends State<ExamPassCelebration>
    with TickerProviderStateMixin {
  late final AnimationController _mainController;
  late final AnimationController _pulseController;
  final _random = math.Random(7);

  /// Muted pastel palette matching the reference confetti image.
  static const _confettiColors = [
    Color(0xFFC75B5B), // maroon red
    Color(0xFF9B8EC4), // lavender
    Color(0xFF6FBFB0), // teal mint
    Color(0xFFE8B89D), // peach
    Color(0xFFB85450), // deeper red
    Color(0xFFA898C9), // soft purple
    Color(0xFF7ECAC0), // light teal
    Color(0xFFF0C4A8), // pale orange
  ];

  late List<_FallingConfettiSpec> _pieces;

  @override
  void initState() {
    super.initState();
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4800),
    )..forward();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _pieces = List.generate(72, (i) {
      final shapeRoll = _random.nextDouble();
      final shape = shapeRoll < 0.45
          ? _ConfettiShape.dash
          : shapeRoll < 0.72
              ? _ConfettiShape.curve
              : _ConfettiShape.streamer;

      return _FallingConfettiSpec(
        xFactor: _random.nextDouble(),
        color: _confettiColors[i % _confettiColors.length],
        shape: shape,
        size: shape == _ConfettiShape.streamer
            ? 14 + _random.nextDouble() * 18
            : 6 + _random.nextDouble() * 8,
        fallSpeed: 0.55 + _random.nextDouble() * 0.85,
        delay: _random.nextDouble() * 0.55,
        rotation: _random.nextDouble() * math.pi * 2,
        spinSpeed: (_random.nextDouble() - 0.5) * math.pi * 3,
        swayPhase: _random.nextDouble() * math.pi * 2,
        swayAmount: 12 + _random.nextDouble() * 22,
      );
    });

    _mainController.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        Future.delayed(const Duration(milliseconds: 600), () {
          if (mounted) widget.onDismiss?.call();
        });
      }
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_mainController, _pulseController]),
      builder: (context, child) {
        final t = _mainController.value;
        final fadeOut = t > 0.78 ? (1 - ((t - 0.78) / 0.22)).clamp(0.0, 1.0) : 1.0;

        return IgnorePointer(
          ignoring: t > 0.35,
          child: GestureDetector(
            onTap: () => widget.onDismiss?.call(),
            behavior: HitTestBehavior.translucent,
            child: Opacity(
              opacity: fadeOut,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CustomPaint(
                    painter: _FallingConfettiPainter(
                      progress: t,
                      specs: _pieces,
                    ),
                  ),
                  _buildBanner(t),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBanner(double t) {
    final pop = Curves.elasticOut.transform((t / 0.35).clamp(0.0, 1.0));
    final pulse = 1 + _pulseController.value * 0.04;
    final passed = widget.variant == ExamCelebrationVariant.passed;

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 72 + (1 - pop) * 40),
        child: Transform.scale(
          scale: pop * pulse,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: passed
                    ? const [Color(0xFF2E7D32), Color(0xFF66BB6A)]
                    : const [Color(0xFFE65100), Color(0xFFFFB74D)],
              ),
              borderRadius: BorderRadius.circular(999),
              boxShadow: [
                BoxShadow(
                  color: (passed ? AppColors.success : AppColors.warning)
                      .withValues(alpha: 0.45),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  passed ? Icons.celebration_rounded : Icons.replay_rounded,
                  color: Colors.white,
                  size: 22,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum _ConfettiShape { dash, curve, streamer }

class _FallingConfettiSpec {
  const _FallingConfettiSpec({
    required this.xFactor,
    required this.color,
    required this.shape,
    required this.size,
    required this.fallSpeed,
    required this.delay,
    required this.rotation,
    required this.spinSpeed,
    required this.swayPhase,
    required this.swayAmount,
  });

  final double xFactor;
  final Color color;
  final _ConfettiShape shape;
  final double size;
  final double fallSpeed;
  final double delay;
  final double rotation;
  final double spinSpeed;
  final double swayPhase;
  final double swayAmount;
}

class _FallingConfettiPainter extends CustomPainter {
  _FallingConfettiPainter({required this.progress, required this.specs});

  final double progress;
  final List<_FallingConfettiSpec> specs;

  @override
  void paint(Canvas canvas, Size size) {
    for (final spec in specs) {
      final localT = ((progress - spec.delay) / (1 - spec.delay)).clamp(0.0, 1.0);
      if (localT <= 0) continue;

      final eased = Curves.easeIn.transform(localT);
      final travel = spec.fallSpeed * eased;
      final y = -40 + travel * (size.height + 80);
      if (y > size.height + 40) continue;

      final sway = math.sin(spec.swayPhase + eased * math.pi * 4) * spec.swayAmount;
      final x = spec.xFactor * size.width + sway;
      final angle = spec.rotation + spec.spinSpeed * eased;
      final alpha = localT < 0.08
          ? (localT / 0.08).clamp(0.0, 1.0)
          : (localT > 0.88 ? (1 - (localT - 0.88) / 0.12).clamp(0.0, 1.0) : 1.0);

      final paint = Paint()
        ..color = spec.color.withValues(alpha: alpha)
        ..strokeWidth = spec.shape == _ConfettiShape.dash ? 2.4 : 2.0
        ..strokeCap = StrokeCap.round
        ..style = spec.shape == _ConfettiShape.dash ? PaintingStyle.fill : PaintingStyle.stroke;

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(angle);

      switch (spec.shape) {
        case _ConfettiShape.dash:
          _drawDash(canvas, paint, spec.size);
        case _ConfettiShape.curve:
          _drawCurve(canvas, paint, spec.size);
        case _ConfettiShape.streamer:
          _drawStreamer(canvas, paint, spec.size);
      }

      canvas.restore();
    }
  }

  void _drawDash(Canvas canvas, Paint paint, double size) {
    final w = size * 1.6;
    final h = size * 0.35;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset.zero, width: w, height: h),
        Radius.circular(h / 2),
      ),
      paint,
    );
  }

  void _drawCurve(Canvas canvas, Paint paint, double size) {
    final path = Path()
      ..moveTo(-size * 0.5, -size * 0.3)
      ..quadraticBezierTo(size * 0.6, 0, -size * 0.5, size * 0.3);
    canvas.drawPath(path, paint..style = PaintingStyle.stroke);
  }

  void _drawStreamer(Canvas canvas, Paint paint, double size) {
    final path = Path()..moveTo(0, -size * 0.55);
    const segments = 4;
    final step = size / segments;
    for (var i = 0; i < segments; i++) {
      final y0 = -size * 0.55 + i * step;
      final y1 = y0 + step;
      final dir = i.isEven ? 1.0 : -1.0;
      path.quadraticBezierTo(dir * size * 0.35, (y0 + y1) / 2, 0, y1);
    }
    canvas.drawPath(path, paint..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant _FallingConfettiPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
