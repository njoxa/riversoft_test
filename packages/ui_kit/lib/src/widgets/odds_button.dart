import 'package:flutter/material.dart';

class OddsButton extends StatefulWidget {
  final String matchId;
  final String oddKey;
  final double oddValue;
  final double? previousOddValue;
  final bool isSelected;
  final VoidCallback onPressed;

  const OddsButton({
    super.key,
    required this.matchId,
    required this.oddKey,
    required this.oddValue,
    this.previousOddValue,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  State<OddsButton> createState() => _OddsButtonState();
}

class _OddsButtonState extends State<OddsButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  Color? _highlightColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);

    if (widget.previousOddValue != null && widget.previousOddValue != widget.oddValue) {
      _determineHighlightColor(widget.previousOddValue!);
  }
  }

  @override
  void didUpdateWidget(OddsButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.oddValue != oldWidget.oddValue) {
      _determineHighlightColor(oldWidget.oddValue);
      if (_highlightColor != null) {
        _runAnimation();
      }
    }
  }

  void _determineHighlightColor(double oldOddValue) {
    if (widget.oddValue > oldOddValue) {
      _highlightColor = Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.3);
    } else {
      _highlightColor = Theme.of(context).colorScheme.onTertiary.withValues(alpha: 0.3);
    }
  }

  void _runAnimation() {
    final colorScheme = Theme.of(context).colorScheme;
    final targetColor = widget.isSelected ? colorScheme.primary : colorScheme.surfaceContainerHighest;

    _colorAnimation = ColorTween(begin: _highlightColor, end: targetColor).animate(_controller);

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final Color buttonColor;
        if (_controller.isAnimating) {
          buttonColor = _colorAnimation.value ?? colorScheme.surfaceContainerHighest;
        } else {
          buttonColor = widget.isSelected ? colorScheme.primary : colorScheme.surfaceContainerHighest;
        }

        return ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
            padding: EdgeInsets.symmetric(horizontal: 12),
            elevation: 0,
          ),
          child: Row(
            children: [
              Text(
                widget.oddKey,
                style: textTheme.bodyMedium?.copyWith(
                  color: widget.isSelected ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
                ),
              ),
              Spacer(),
              Text(
                widget.oddValue.toStringAsFixed(2),
                style: textTheme.bodyLarge?.copyWith(
                  color: widget.isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
