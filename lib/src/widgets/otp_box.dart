import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/otp_theme.dart';

/// A single OTP input box widget.
///
/// This widget handles:
/// - Single digit input
/// - Focus navigation
/// - Backspace behavior
/// - Custom styling
/// - OTP autofill support
/// - Optional text obscuring
class OtpBox extends StatelessWidget {

  /// Controller for managing the text value.
  final TextEditingController controller;

  /// Focus node for the current OTP field.
  final FocusNode focusNode;

  /// Focus node for the next OTP field.
  final FocusNode? nextFocus;

  /// Focus node for the previous OTP field.
  final FocusNode? previousFocus;

  /// Theme configuration for styling the OTP box.
  final OtpTheme theme;

  /// Callback triggered when the field value changes.
  final ValueChanged<String> onChanged;

  /// Whether to hide the entered character.
  final bool obscureText;

  /// Character used when [obscureText] is enabled.
  final String obscuringCharacter;

  /// Creates an [OtpBox].
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
        focusNode: FocusNode(),

        // Listener focus node
        onKeyEvent: (event) {
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.backspace) {
            if (controller.text.isEmpty && previousFocus != null) {
              previousFocus!.requestFocus();
            }
          }
        },
        child: Container(
          decoration:
          isFocused ? theme.focusedDecoration : theme.decoration,
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

            /// Handles OTP input changes and focus movement.
            onChanged: (value) {
              if (value.isNotEmpty) {
                nextFocus?.requestFocus();
              } else if (value.isEmpty && previousFocus != null) {
                previousFocus!.requestFocus();
              }

              onChanged(value);
            },

            /// Moves cursor to the end when tapped.
            onTap: () {
              controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length),
              );
            },

            /// Removes focus when tapped outside.
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