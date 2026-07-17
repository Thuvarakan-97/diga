import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/ai_support/domain/services/ai_tutor_engine.dart';
import 'package:diga/l10n/app_localizations.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:flutter/material.dart';

/// Full-screen AI tutor chat (rule-based coaching for demo).
class AiTutorChatScreen extends StatefulWidget {
  const AiTutorChatScreen({
    super.key,
    required this.tutorContext,
    this.patientMode = false,
  });

  final AiTutorContext tutorContext;
  final bool patientMode;

  @override
  State<AiTutorChatScreen> createState() => _AiTutorChatScreenState();
}

class _AiTutorChatScreenState extends State<AiTutorChatScreen> {
  final _controller = TextEditingController();
  final _scroll = ScrollController();
  final _messages = <AiTutorMessage>[];
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _seedOpening());
  }

  void _seedOpening() {
    final l10n = context.l10n;
    if (widget.patientMode) {
      setState(() {
        _messages.add(
          AiTutorMessage(
            text: '${widget.tutorContext.patientName}: "${_patientOpening()}"',
            isUser: false,
          ),
        );
      });
    } else {
      setState(() {
        _messages.add(
          AiTutorMessage(text: AiTutorEngine.openingMessage(widget.tutorContext, l10n), isUser: false),
        );
      });
    }
  }

  String _patientOpening() {
    final domain = widget.tutorContext.moduleId.toLowerCase();
    if (domain.contains('mental')) {
      return 'Doctor, I am unsure which depression app is right for me. What should I expect?';
    }
    if (domain.contains('msk') || domain.contains('vivira')) {
      return 'Will this exercise app really help my back pain?';
    }
    return 'Doctor, what should I realistically expect from this digital therapy?';
  }

  @override
  void dispose() {
    _controller.dispose();
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _send([String? preset]) async {
    final text = (preset ?? _controller.text).trim();
    if (text.isEmpty || _busy) return;
    _controller.clear();
    setState(() {
      _messages.add(AiTutorMessage(text: text, isUser: true));
      _messages.add(const AiTutorMessage(text: '...', isUser: false, isTyping: true));
      _busy = true;
    });
    _scrollToEnd();

    final l10n = context.l10n;
    final reply = widget.patientMode
        ? await _patientReply(text, l10n)
        : await AiTutorEngine.respond(
            userMessage: text,
            ctx: widget.tutorContext,
            l10n: l10n,
          );

    if (!mounted) return;
    setState(() {
      _messages.removeLast();
      _messages.add(
        AiTutorMessage(
          text: widget.patientMode ? '${widget.tutorContext.patientName}: "$reply"' : reply,
          isUser: false,
        ),
      );
      _busy = false;
    });
    _scrollToEnd();
  }

  Future<String> _patientReply(String doctorText, AppLocalizations l10n) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    final lower = doctorText.toLowerCase();
    if (lower.contains('week') || lower.contains('daily') || lower.contains('tag')) {
      return l10n.aiPatientReplySchedule;
    }
    if (lower.contains('side') || lower.contains('safe') || lower.contains('neben')) {
      return l10n.aiPatientReplySafety;
    }
    if (lower.contains('evidence') || lower.contains('study') || lower.contains('wirksam')) {
      return l10n.aiPatientReplyEvidence;
    }
    return l10n.aiPatientReplyGeneral;
  }

  void _scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scroll.hasClients) return;
      _scroll.animateTo(
        _scroll.position.maxScrollExtent + 80,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final quick = widget.patientMode
        ? [
            l10n.aiPatientChipExpectations,
            l10n.aiPatientChipTime,
            l10n.aiPatientChipPrivacy,
          ]
        : AiTutorEngine.quickPrompts(widget.tutorContext, l10n);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.patientMode ? l10n.aiPatientChatTitle : l10n.aiTutorChatTitle),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
            color: AppColors.accentSoft.withValues(alpha: 0.35),
            child: Row(
              children: [
                Icon(
                  widget.patientMode ? Icons.record_voice_over_rounded : Icons.psychology_rounded,
                  size: 18,
                  color: AppColors.accent,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.patientMode
                        ? l10n.aiPatientChatSubtitle(widget.tutorContext.patientName)
                        : l10n.aiTutorChatSubtitle(widget.tutorContext.domainName),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scroll,
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final m = _messages[index];
                return _Bubble(message: m);
              },
            ),
          ),
          if (!_busy)
            SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                children: [
                  for (final q in quick)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ActionChip(
                        label: Text(q, style: const TextStyle(fontSize: 12)),
                        onPressed: () => _send(q),
                      ),
                    ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.sm, AppSpacing.xs, AppSpacing.sm, AppSpacing.md),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: l10n.aiTutorInputHint,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadii.pill)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _send(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: _busy ? null : () => _send(),
                  icon: const Icon(Icons.send_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.message});

  final AiTutorMessage message;

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.82),
        decoration: BoxDecoration(
          color: isUser ? AppColors.primary : AppColors.surfaceVariant,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isUser ? 16 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 16),
          ),
        ),
        child: message.isTyping
            ? const SizedBox(
                width: 36,
                height: 18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Dot(delay: 0),
                    SizedBox(width: 4),
                    _Dot(delay: 150),
                    SizedBox(width: 4),
                    _Dot(delay: 300),
                  ],
                ),
              )
            : Text(
                message.text,
                style: TextStyle(
                  color: isUser ? Colors.white : AppColors.textMuted,
                  height: 1.4,
                  fontSize: 14,
                ),
              ),
      ),
    );
  }
}

class _Dot extends StatefulWidget {
  const _Dot({required this.delay});

  final int delay;

  @override
  State<_Dot> createState() => _DotState();
}

class _DotState extends State<_Dot> with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 600))
      ..repeat(reverse: true);
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _c.forward();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _c,
      child: Container(
        width: 6,
        height: 6,
        decoration: const BoxDecoration(color: AppColors.accent, shape: BoxShape.circle),
      ),
    );
  }
}
