import 'dart:async';
import 'package:flutter/material.dart';

class ResendTimer extends StatefulWidget {
  final int seconds;
  final VoidCallback onResend;
  final TextStyle? textStyle;
  final TextStyle? buttonStyle;
  final String resendText;
  final String timerText;

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
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _remainingSeconds = widget.seconds;

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

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