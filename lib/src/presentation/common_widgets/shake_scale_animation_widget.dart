import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class SeesawZoom extends StatefulWidget {
  const SeesawZoom({
    super.key,
    required this.child,

    // Motion look & feel
    this.maxDegrees = 10,                    // peak tilt (each side)
    this.minScale = 0.98,                    // zoom range
    this.maxScale = 1.06,
    this.period = const Duration(milliseconds: 1400), // full swing L->R->L

    // Run control
    this.runFor = const Duration(seconds: 3),         // how long to animate
    this.settleDuration = const Duration(milliseconds: 280), // ease back to rest
    this.autoStart = true,                    // start when built
    this.startOnTap = false,                  // start when tapped (in addition)

    // Pivot point of rotation
    this.anchor = Alignment.center,           // try Alignment.bottomCenter
    this.onStart,
    this.onStop,
  });

  final Widget child;

  // Look & feel
  final double maxDegrees;
  final double minScale;
  final double maxScale;
  final Duration period;

  // Run behavior
  final Duration runFor;
  final Duration settleDuration;
  final bool autoStart;
  final bool startOnTap;

  // Pivot
  final Alignment anchor;

  // Callbacks
  final VoidCallback? onStart;
  final VoidCallback? onStop;

  @override
  State<SeesawZoom> createState() => SeesawZoomState();
}

class SeesawZoomState extends State<SeesawZoom> with TickerProviderStateMixin {
  late final AnimationController _motion; // repeats during active run
  late final AnimationController _settle; // tween back to rest on stop

  Timer? _stopTimer;
  bool _running = false;

  // Capture where we stopped so we can tween back to neutral
  double _lastAngle = 0.0;
  double _lastScale = 1.0;

  @override
  void initState() {
    super.initState();
    _motion = AnimationController(vsync: this, duration: widget.period);
    _settle = AnimationController(vsync: this, duration: widget.settleDuration);

    if (widget.autoStart) {
      WidgetsBinding.instance.addPostFrameCallback((_) => start());
    }
  }

  @override
  void dispose() {
    _stopTimer?.cancel();
    _motion.dispose();
    _settle.dispose();
    super.dispose();
  }

  /// Public method you can call with a GlobalKey<SeesawZoomState>()
  void start() {
    if (_running) return; // ignore if already running
    _running = true;
    widget.onStart?.call();
    _settle.stop();
    _motion
      ..reset()
      ..repeat(); // 0..1 loop

    _stopTimer?.cancel();
    _stopTimer = Timer(widget.runFor, () {
      // capture current transforms
      final t = _motion.value; // 0..1 phase
      _lastAngle = _angleAt(t);
      _lastScale = _scaleAt(t);

      _motion.stop();
      _running = false;

      _settle
        ..reset()
        ..forward().whenComplete(() {
          widget.onStop?.call();
        });
    });
  }

  double _angleAt(double t) {
    // smooth continuous seesaw: -max..+max using sine
    final maxRad = widget.maxDegrees * math.pi / 180.0;
    return math.sin(2 * math.pi * t) * maxRad;
  }

  double _scaleAt(double t) {
    // oscillate between minScale and maxScale in sync with tilt
    final s = (math.sin(2 * math.pi * t) + 1) / 2; // 0..1
    return _lerp(widget.minScale, widget.maxScale, s);
  }

  double _lerp(double a, double b, double t) => a + (b - a) * t;

  @override
  Widget build(BuildContext context) {
    Widget content = AnimatedBuilder(
      animation: Listenable.merge([_motion, _settle]),
      builder: (_, child) {
        double angle, scale;

        if (_running) {
          final t = _motion.value;
          angle = _angleAt(t);
          scale = _scaleAt(t);
        } else if (_settle.isAnimating) {
          // tween from last -> neutral
          final u = _settle.value; // 0..1
          angle = _lerp(_lastAngle, 0.0, u);
          scale = _lerp(_lastScale, 1.0, u);
        } else {
          angle = 0.0;
          scale = 1.0;
        }

        return Transform.rotate(
          angle: angle,
          alignment: widget.anchor,
          child: Transform.scale(
            scale: scale,
            child: child,
          ),
        );
      },
      child: widget.child,
    );

    if (widget.startOnTap) {
      content = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: start,
        child: content,
      );
    }

    return content;
  }
}
