import 'package:flutter/material.dart';
import '../controller/otp_controller.dart';
import '../theme/otp_theme.dart';
import 'otp_box.dart';

class SmartOtpFieldPlus extends StatefulWidget {
  final int length;
  final OtpController? controller;
  final OtpTheme theme;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;

  /// Hide OTP characters
  final bool obscureText;

  /// Character to show when obscured
  final String obscuringCharacter;

  const SmartOtpFieldPlus({
    super.key,
    this.length = 6,
    this.controller,
    this.theme = const OtpTheme(),
    this.onChanged,
    this.onCompleted,
    this.obscureText = false,
    this.obscuringCharacter = '•',
  });

  @override
  State<SmartOtpFieldPlus> createState() => _SmartOtpFieldPlusState();
}

class _SmartOtpFieldPlusState extends State<SmartOtpFieldPlus> {
  late OtpController otpController;
  late bool _internalController;

  @override
  void initState() {
    super.initState();

    _internalController = widget.controller == null;
    otpController = widget.controller ?? OtpController(length: widget.length);

    for (final node in otpController.focusNodes) {
      node.addListener(() {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    if (_internalController) {
      otpController.dispose();
    }
    super.dispose();
  }

  void _handleChange(String _) {
    final value = otpController.value;

    widget.onChanged?.call(value);

    if (otpController.isComplete) {
      widget.onCompleted?.call(value);
    }

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.theme.spacing / 2,
          ),
          child: OtpBox(
            controller: otpController.controllers[index],
            focusNode: otpController.focusNodes[index],
            nextFocus: index < widget.length - 1
                ? otpController.focusNodes[index + 1]
                : null,
            previousFocus:
            index > 0 ? otpController.focusNodes[index - 1] : null,
            theme: widget.theme,
            onChanged: _handleChange,
            obscureText: widget.obscureText,
            obscuringCharacter: widget.obscuringCharacter,
          ),
        );
      }),
    );
  }
}