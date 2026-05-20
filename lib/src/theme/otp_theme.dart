import 'package:flutter/material.dart';

/// Theme configuration for OTP input fields.
///
/// This class allows customization of:
/// - Box size
/// - Border styles
/// - Fill colors
/// - Text appearance
/// - Cursor color
/// - Border radius
class OtpTheme {

  /// Width of each OTP input box.
  final double boxWidth;

  /// Height of each OTP input box.
  final double boxHeight;

  /// Spacing between OTP input boxes.
  final double spacing;

  /// Text style used inside OTP fields.
  final TextStyle textStyle;

  /// Border color of inactive OTP fields.
  final Color borderColor;

  /// Border color of the focused OTP field.
  final Color focusedBorderColor;

  /// Border width of inactive OTP fields.
  final double borderWidth;

  /// Border width of the focused OTP field.
  final double focusedBorderWidth;

  /// Border radius for OTP input boxes.
  final BorderRadius borderRadius;

  /// Background color of inactive OTP fields.
  final Color fillColor;

  /// Background color of the focused OTP field.
  final Color focusedFillColor;

  /// Cursor color inside OTP fields.
  final Color cursorColor;

  /// Creates an [OtpTheme] with customizable styling options.
  const OtpTheme({
    this.boxWidth = 50,
    this.boxHeight = 55,
    this.spacing = 8,
    this.textStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.borderWidth = 1,
    this.focusedBorderWidth = 2,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(8),
    ),
    this.fillColor = Colors.transparent,
    this.focusedFillColor = Colors.transparent,
    this.cursorColor = Colors.blue,
  });

  /// Decoration used for inactive OTP input fields.
  BoxDecoration get decoration => BoxDecoration(
    color: fillColor,
    border: Border.all(
      color: borderColor,
      width: borderWidth,
    ),
    borderRadius: borderRadius,
  );

  /// Decoration used for the focused OTP input field.
  BoxDecoration get focusedDecoration => BoxDecoration(
    color: focusedFillColor,
    border: Border.all(
      color: focusedBorderColor,
      width: focusedBorderWidth,
    ),
    borderRadius: borderRadius,
  );
}