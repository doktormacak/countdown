import 'dart:async';
import 'package:countdown/domain/models/countdown_calculator/countdown_calculator.dart';
import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:flutter/material.dart';

class CountdownDisplay extends StatefulWidget {
  final CountdownEvent event;
  final CountdownDisplayStyle displayStyle;

  const CountdownDisplay({
    super.key,
    required this.event,
    this.displayStyle = CountdownDisplayStyle.compact,
  });

  @override
  State<CountdownDisplay> createState() => _CountdownDisplayState();
}

class _CountdownDisplayState extends State<CountdownDisplay> {
  late Timer _timer;
  TimeRemaining _timeRemaining =
      const TimeRemaining(days: 0, hours: 0, minutes: 0, seconds: 0);

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
}
