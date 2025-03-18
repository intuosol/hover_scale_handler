import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Adds a hover scale effect to a widget. Scales a widget up when the
/// mouse is hovering over it and down when the mouse is not hovering
/// over it or when the widget is tapped.
class HoverScaleHandler extends StatefulWidget {
  /// Creates a [HoverScaleHandler] widget.
  const HoverScaleHandler({
    super.key,
    required this.child,
    this.onTap,
    this.tooltip = '',
    this.scaleOnHover = 1.05,
    this.defaultScale = 1.0,
    this.animationDuration = const Duration(milliseconds: 100),
    this.tooltipWaitDuration = const Duration(milliseconds: 500),
    this.tapAnimationDelay = const Duration(milliseconds: 50),
    this.curve = Curves.easeInOut,
    this.reverseCurve,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.enableFeedback = false,
    this.cursor,
  });

  /// The widget to apply the hover scale effect to.
  final Widget child;

  /// The function to call when the widget is tapped.
  /// If null, the hover scale effect will be disabled.
  final Function()? onTap;

  /// The tooltip to display when hovering over the widget.
  final String tooltip;

  /// The scale factor to apply when hovering over the widget.
  /// Defaults to 1.05 (5% larger).
  final double scaleOnHover;

  /// The default scale factor when not hovering.
  /// Defaults to 1.0 (no scaling).
  final double defaultScale;

  /// The duration of the scale animation.
  /// Defaults to 100 milliseconds.
  final Duration animationDuration;

  /// The duration to wait before showing the tooltip.
  /// Defaults to 500 milliseconds.
  final Duration tooltipWaitDuration;

  /// Additional delay after the first tap animation and before returning to hover scale.
  /// Defaults to 50 milliseconds.
  final Duration tapAnimationDelay;

  /// The curve to apply when scaling up on hover.
  /// Defaults to [Curves.easeInOut].
  final Curve curve;

  /// The curve to apply when scaling down after hover.
  /// If null, it will use the same curve as [curve].
  final Curve? reverseCurve;

  /// Determines how the GestureDetector's hit tests should behave.
  /// Defaults to [HitTestBehavior.opaque].
  final HitTestBehavior hitTestBehavior;

  /// Whether to produce haptic feedback when tapped.
  /// Defaults to false.
  final bool enableFeedback;

  /// The cursor to show when hovering over the widget.
  /// Defaults to [SystemMouseCursors.click] if onTap is not null,
  /// otherwise [SystemMouseCursors.basic].
  final MouseCursor? cursor;

  @override
  State<HoverScaleHandler> createState() => HoverScaleHandlerState();
}

/// The state for [HoverScaleHandler].
class HoverScaleHandlerState extends State<HoverScaleHandler> {
  /// The current scale of the widget.
  late double currentScale;

  /// Whether the widget has been tapped.
  bool tapped = false;

  /// Whether the mouse is hovering over the widget.
  bool isHovering = false;

  @override
  void initState() {
    super.initState();
    currentScale = widget.defaultScale;
  }

  @override
  void didUpdateWidget(HoverScaleHandler oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update scale if default scale changed
    if (oldWidget.defaultScale != widget.defaultScale && !isHovering) {
      currentScale = widget.defaultScale;
    } else if (oldWidget.scaleOnHover != widget.scaleOnHover && isHovering) {
      currentScale = widget.scaleOnHover;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Default cursor is click if the onTap is provided, otherwise basic
    final MouseCursor mouseCursor =
        widget.cursor ??
        (widget.onTap != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic);

    // If onTap is null, we don't need hover effects
    final bool enableHoverEffect = widget.onTap != null;

    // Get the animation curve and its reverse
    final Curve animationCurve = widget.curve;
    final Curve reverseAnimationCurve = widget.reverseCurve ?? animationCurve;

    return Tooltip(
      message: widget.tooltip,
      waitDuration: widget.tooltipWaitDuration,
      child: MouseRegion(
        cursor: mouseCursor,
        onEnter:
            enableHoverEffect
                ? (PointerEvent event) => setState(() {
                  isHovering = true;
                  currentScale = widget.scaleOnHover;
                })
                : null,
        onExit:
            enableHoverEffect
                ? (PointerEvent event) => setState(() {
                  isHovering = false;
                  currentScale = widget.defaultScale;
                })
                : null,
        child: GestureDetector(
          behavior: widget.hitTestBehavior,
          onTap:
              widget.onTap == null
                  ? null
                  : () async {
                    if (tapped) {
                      return;
                    }

                    tapped = true;

                    // Provide haptic feedback if enabled
                    if (widget.enableFeedback) {
                      HapticFeedback.lightImpact();
                    }

                    setState(() {
                      currentScale = widget.defaultScale;
                    });

                    await Future<void>.delayed(
                      Duration(
                        milliseconds:
                            widget.animationDuration.inMilliseconds +
                            widget.tapAnimationDelay.inMilliseconds,
                      ),
                    );

                    setState(() {
                      currentScale = widget.scaleOnHover;
                    });

                    await Future<void>.delayed(widget.animationDuration);

                    if (!isHovering) {
                      setState(() {
                        currentScale = widget.defaultScale;
                      });
                    }

                    widget.onTap?.call();

                    tapped = false;
                  },
          child: AnimatedScale(
            scale: currentScale,
            duration: widget.animationDuration,
            curve: isHovering ? animationCurve : reverseAnimationCurve,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
