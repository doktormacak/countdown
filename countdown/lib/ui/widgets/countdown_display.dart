import 'dart:async';
import 'dart:math' as math;
import 'package:countdown/domain/models/countdown_calculator/countdown_calculator.dart';
import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:flutter/material.dart';

class CountdownDisplay extends StatefulWidget {
  final CountdownEvent event;
  final CountdownDisplayStyle displayStyle;

  const CountdownDisplay({
    super.key,
    required this.event,
    this.displayStyle = CountdownDisplayStyle.circular,
  });

  @override
  State<CountdownDisplay> createState() => _CountdownDisplayState();
}

class _CountdownDisplayState extends State<CountdownDisplay> {
  late Timer _timer;
  TimeRemaining _timeRemaining =
      const TimeRemaining(days: 0, hours: 0, minutes: 0, seconds: 0);

  late final TimeRemaining _sinceEventCreated =
      CountdownCalculator.getTimeRemainingSinceEventCreated(widget.event);

  @override
  void initState() {
    super.initState();
    _updateTimeRemaining();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateTimeRemaining();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTimeRemaining() {
    setState(() {
      _timeRemaining = CountdownCalculator.getTimeRemaining(widget.event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget.displayStyle) {
      CountdownDisplayStyle.compact => _buildCompactDisplay(context),
      CountdownDisplayStyle.detailed => _buildDetailedDisplay(context),
      CountdownDisplayStyle.fullscreen => _buildFullscreenDisplay(context),
      CountdownDisplayStyle.minimal => _buildMinimalDisplay(context),
      CountdownDisplayStyle.circular => CircularDisplay(
          timeRemaining: _timeRemaining,
          event: widget.event,
          sinceEventCreated: _sinceEventCreated),
    };
  }

  Widget _buildCompactDisplay(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        _timeRemaining.formatted,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: _timeRemaining.isNegative
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildMinimalDisplay(BuildContext context) {
    return Text(
      _timeRemaining.formatted,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: _timeRemaining.isNegative
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildDetailedDisplay(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.event.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: _getBackgroundColor(context),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.timer),
              const SizedBox(width: 8),
              Text(
                _timeRemaining.formatted,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: _timeRemaining.isNegative
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFullscreenDisplay(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.event.title,
          style: textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        _buildDigitalClockDisplay(context),
        const SizedBox(height: 24),
        if (widget.event.notes != null && widget.event.notes!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              widget.event.notes!,
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }

  Widget _buildDigitalClockDisplay(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTimeUnit(context, _timeRemaining.days, 'DAYS'),
        _buildTimeSeparator(context),
        _buildTimeUnit(context, _timeRemaining.hours, 'HOURS'),
        _buildTimeSeparator(context),
        _buildTimeUnit(context, _timeRemaining.minutes, 'MINS'),
        _buildTimeSeparator(context),
        _buildTimeUnit(context, _timeRemaining.seconds, 'SECS'),
      ],
    );
  }

  Widget _buildTimeUnit(BuildContext context, int value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value.toString().padLeft(2, '0'),
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSeparator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        ':',
        style: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    if (_timeRemaining.isComplete) {
      return Theme.of(context)
          .colorScheme
          .errorContainer
          .withValues(alpha: 0.3);
    }

    if (_timeRemaining.days == 0) {
      if (_timeRemaining.hours < 1) {
        // Less than 1 hour - urgent
        return Theme.of(context)
            .colorScheme
            .errorContainer
            .withValues(alpha: 0.3);
      } else if (_timeRemaining.hours < 3) {
        // Less than 3 hours - warning
        return Theme.of(context)
            .colorScheme
            .tertiaryContainer
            .withValues(alpha: 0.3);
      }
    }

    // Default
    return Theme.of(context)
        .colorScheme
        .secondaryContainer
        .withValues(alpha: 0.3);
  }
}

enum CountdownDisplayStyle {
  minimal, // Just the time text
  compact, // Time with a small container
  detailed, // Title and time with more info
  fullscreen, // Large display for full-screen view
  circular, // Circular progress indicator
}

class CircularDisplay extends StatelessWidget {
  const CircularDisplay(
      {super.key,
      required this.timeRemaining,
      required this.event,
      required this.sinceEventCreated});

  final TimeRemaining timeRemaining;
  final CountdownEvent event;
  final TimeRemaining sinceEventCreated;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size.width * 0.8;

    return Container(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Days circle (outermost)
          CircularUnit(
            size: size,
            value: timeRemaining.days,
            maxValue: sinceEventCreated.days, // Max days to show full circle
            color: colorScheme.primary,
            strokeWidth: 20,
          ),

          // Hours circle
          CircularUnit(
            size: size - 50,
            value: timeRemaining.hours,
            maxValue: sinceEventCreated.hours,
            color: colorScheme.secondary,
            strokeWidth: 20,
          ),

          // Minutes circle
          CircularUnit(
            size: size - 100,
            value: timeRemaining.minutes,
            maxValue: sinceEventCreated.minutes,
            color: colorScheme.tertiary,
            strokeWidth: 20,
          ),

          // Seconds circle (innermost)
          CircularUnit(
            size: size - 150,
            value: timeRemaining.seconds,
            maxValue: 60,
            color: colorScheme.error,
            strokeWidth: 20,
          ),

          // Center text display
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                event.title,
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                timeRemaining.formatted,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final double strokeWidth;

  CircleProgressPainter({
    required this.progress,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Draw progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // Start at the top
      2 * math.pi * progress, // Arc angle
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CircularUnit extends StatefulWidget {
  const CircularUnit({
    super.key,
    required this.size,
    required this.value,
    required this.maxValue,
    required this.color,
    required this.strokeWidth,
  });

  final double size;
  final int value;
  final int maxValue;
  final Color color;
  final double strokeWidth;

  @override
  State<CircularUnit> createState() => _CircularUnitState();
}

class _CircularUnitState extends State<CircularUnit>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double _oldProgress;
  late double _currentProgress;

  @override
  void initState() {
    super.initState();
    _oldProgress = 0.0;
    _currentProgress = widget.value / widget.maxValue.toDouble();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(
      begin: _oldProgress,
      end: _currentProgress,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void didUpdateWidget(CircularUnit oldWidget) {
    super.didUpdateWidget(oldWidget);
    // When the widget updates (new value), animate to the new progress
    if (oldWidget.value != widget.value) {
      _oldProgress = _currentProgress;
      _currentProgress = widget.value / widget.maxValue.toDouble();

      _animation = Tween<double>(
        begin: _oldProgress,
        end: _currentProgress,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));

      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color.withOpacity(0.1),
            ),
          ),

          // Progress circle with animation
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                size: Size(widget.size, widget.size),
                painter: CircleProgressPainter(
                  progress: _animation.value,
                  progressColor: widget.color,
                  strokeWidth: widget.strokeWidth,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
