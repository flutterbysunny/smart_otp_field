import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/otp_theme.dart';

class OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final FocusNode? previousFocus;
  final OtpTheme theme;
  final ValueChanged<String> onChanged;

  final bool obscureText;
  final String obscuringCharacter;

  const OtpBox({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocus,
    this.previousFocus,
    required this.theme,
    required this.onChanged,
    this.obscureText = false,
    this.obscuringCharacter = '•',
  });

  @override
  Widget build(BuildContext context) {
    final isFocused = focusNode.hasFocus;

    return SizedBox(
      width: theme.boxWidth,
      height: theme.boxHeight,
      child: KeyboardListener(
        focusNode: FocusNode(), // listener focus
        onKeyEvent: (event) {
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.backspace) {
            if (controller.text.isEmpty && previousFocus != null) {
              previousFocus!.requestFocus();
            }
          }
        },
        child: Container(
          decoration: isFocused
              ? theme.focusedDecoration
              : theme.decoration,
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,

            obscureText: obscureText,
            obscuringCharacter: obscuringCharacter,

            autofillHints: const [AutofillHints.oneTimeCode],

            style: theme.textStyle,
            cursorColor: theme.cursorColor,

            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: '',
              contentPadding: EdgeInsets.zero,
            ),

            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],

            onChanged: (value) {
              if (value.isNotEmpty) {
                nextFocus?.requestFocus();
              } else if (value.isEmpty && previousFocus != null) {
                previousFocus!.requestFocus();
              }

              onChanged(value);
            },

            onTap: () {
              controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length),
              );
            },

            onTapOutside: (_) {
              focusNode.unfocus();
            },

            enableInteractiveSelection: false,
          ),
        ),
      ),
    );
  }
}