import 'dart:async';

import 'package:flutter/material.dart';

/// A countdown timer widget for OTP resend functionality.
///
/// This widget displays:
/// - A countdown timer
/// - A resend button after timer completion
/// - Customizable text styles
///
/// Commonly used in OTP verification screens.
class ResendTimer extends StatefulWidget {

  /// Total countdown duration in seconds.
  final int seconds;

  /// Callback triggered when resend is requested.
  final VoidCallback onResend;

  /// Text style for the countdown timer text.
  final TextStyle? textStyle;

  /// Text style for the resend button text.
  final TextStyle? buttonStyle;

  /// Text displayed for the resend action.
  final String resendText;

  /// Prefix text displayed before the countdown timer.
  final String timerText;

  /// Creates a [ResendTimer].
  const ResendTimer({
    super.key,
    this.seconds = 30,
    required this.onResend,
    this.textStyle,
    this.buttonStyle,
    this.resendText = "Resend OTP",
    this.timerText = "Resend in",
  });

  @override
  State<ResendTimer> createState() => _ResendTimerState();
}

class _ResendTimerState extends State<ResendTimer> {

  /// Remaining countdown seconds.
  late int _remainingSeconds;

  /// Internal timer instance.
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  /// Starts or restarts the countdown timer.
  void _startTimer() {
    _remainingSeconds = widget.seconds;

    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (_remainingSeconds == 0) {
          timer.cancel();
        } else {
          setState(() {
            _remainingSeconds--;
          });
        }
      },
    );
  }

  /// Handles resend button tap.
  void _handleResend() {
    widget.onResend();

    _startTimer();

    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_remainingSeconds > 0) {
      return Text(
        "${widget.timerText} $_remainingSeconds s",
        style: widget.textStyle,
      );
    }

    return GestureDetector(
      onTap: _handleResend,
      child: Text(
        widget.resendText,
        style:
        widget.buttonStyle ??
            const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}