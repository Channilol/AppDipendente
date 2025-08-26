import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneralButton extends StatefulWidget {
  const GeneralButton({
    super.key,
    this.label,
    this.icon,
    this.height = 50,
    this.width = 200,
    this.color = CupertinoColors.systemBlue,
    this.textColor = CupertinoColors.white,
    this.iconColor = CupertinoColors.white,
    this.textSize,
    this.iconSize,
    this.isEnabled = true,
    this.isLoading = false,
    this.style = ButtonStyle.filled,
    required this.function,
  });

  final String? label;
  final IconData? icon;
  final double? height;
  final double? width;
  final Color color;
  final Color textColor;
  final Color iconColor;
  final double? textSize;
  final double? iconSize;
  final bool isEnabled;
  final bool isLoading;
  final ButtonStyle style;
  final Function function;

  @override
  State<GeneralButton> createState() => _GeneralButtonState();
}

enum ButtonStyle { filled, tinted, plain }

class _GeneralButtonState extends State<GeneralButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.6).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (!widget.isEnabled || widget.isLoading) return;
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    if (!widget.isEnabled || widget.isLoading) return;

    _animationController.reverse();
    HapticFeedback.lightImpact();
    widget.function();
  }

  void _onTapCancel() {
    _animationController.reverse();
  }

  Color get _backgroundColor {
    if (!widget.isEnabled) {
      return widget.color.withValues(alpha: 0.3);
    }

    switch (widget.style) {
      case ButtonStyle.filled:
        return widget.color;
      case ButtonStyle.tinted:
        return widget.color.withValues(alpha: 0.15);
      case ButtonStyle.plain:
        return Colors.transparent;
    }
  }

  Color get _textColor {
    if (!widget.isEnabled) {
      return widget.textColor.withValues(alpha: 0.3);
    }

    switch (widget.style) {
      case ButtonStyle.filled:
        return widget.textColor;
      case ButtonStyle.tinted:
      case ButtonStyle.plain:
        return widget.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  color: _backgroundColor,
                  borderRadius: BorderRadius.circular(
                    10,
                  ), // iOS standard radius
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.isLoading)
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CupertinoActivityIndicator(color: _textColor),
                        )
                      else if (widget.icon != null)
                        Icon(
                          widget.icon,
                          color: widget.iconColor,
                          size: widget.iconSize ?? 17,
                        ),

                      if (widget.label != null &&
                          (widget.icon != null || widget.isLoading))
                        SizedBox(width: 6),

                      if (widget.label != null)
                        Flexible(
                          child: Text(
                            widget.label!,
                            style: TextStyle(
                              color: _textColor,
                              fontSize: widget.textSize ?? 17, // iOS standard
                              fontWeight: FontWeight.w600, // iOS semibold
                              letterSpacing: -0.41, // iOS tight tracking
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
