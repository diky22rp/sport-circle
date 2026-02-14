import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sport_circle/core/themes/app_theme.dart';

class SportCircleLoading extends StatefulWidget {
  final bool isOverlay;

  const SportCircleLoading({super.key, this.isOverlay = true});

  @override
  State<SportCircleLoading> createState() => _SportCircleLoadingState();
}

class _SportCircleLoadingState extends State<SportCircleLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late String _randomText;

  bool _isVisible = false;

  final List<String> _loadingMessages = [
    "Santai, bentar ya",
    "Lagi diproses nih",
    "Dikit lagi beres",
    "Tungguin bentar ya",
    "Hampir kelar",
    "Dikit lagi siap",
  ];

  @override
  void initState() {
    super.initState();
    _randomText = _loadingMessages[Random().nextInt(_loadingMessages.length)];

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isOverlay
        ? Colors.black.withValues(alpha: 0.7)
        : Colors.transparent;

    final textColor = widget.isOverlay ? Colors.white : Colors.grey[600];
    final iconBgColor = widget.isOverlay
        ? Colors.white.withValues(alpha: 0.1)
        : Colors.grey[200];
    final iconColor = widget.isOverlay ? Colors.white : AppTheme.primary;

    return Material(
      color: bgColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RotationTransition(
              turns: _controller,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.elasticOut,
                  padding: EdgeInsets.all(_isVisible ? 24 : 10),
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: iconColor.withValues(alpha: 0.2),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.group_work_rounded,
                    color: iconColor,
                    size: widget.isOverlay ? 50 : 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: Text(
                _randomText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: widget.isOverlay ? 14 : 12,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
