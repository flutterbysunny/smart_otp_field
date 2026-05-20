import 'package:flutter/material.dart';

class OtpTheme {
  final double boxWidth;
  final double boxHeight;
  final double spacing;

  final TextStyle textStyle;

  final Color borderColor;
  final Color focusedBorderColor;

  final double borderWidth;
  final double focusedBorderWidth;

  final BorderRadius borderRadius;

  /// User custom fill colors
  final Color fillColor;
  final Color focusedFillColor;

  final Color cursorColor;

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

  BoxDecoration get decoration => BoxDecoration(
    color: fillColor,
    border: Border.all(
      color: borderColor,
      width: borderWidth,
    ),
    borderRadius: borderRadius,
  );

  BoxDecoration get focusedDecoration => BoxDecoration(
    color: focusedFillColor,
    border: Border.all(
      color: focusedBorderColor,
      width: focusedBorderWidth,
    ),
    borderRadius: borderRadius,
  );
}