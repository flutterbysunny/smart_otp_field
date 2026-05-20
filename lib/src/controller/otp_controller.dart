import 'package:flutter/material.dart';

/// Controller for managing OTP input fields.
///
/// This controller handles:
/// - Text editing controllers
/// - Focus nodes
/// - OTP value retrieval
/// - Clearing and disposing resources
class OtpController {

  /// Total number of OTP input fields.
  final int length;

  /// List of text controllers for each OTP field.
  final List<TextEditingController> controllers;

  /// List of focus nodes for handling field focus.
  final List<FocusNode> focusNodes;

  /// Creates an [OtpController].
  ///
  /// By default, the OTP length is set to 6.
  OtpController({this.length = 6})
      : controllers =
  List.generate(length, (_) => TextEditingController()),
        focusNodes = List.generate(length, (_) => FocusNode());

  /// Returns the complete OTP value as a single string.
  String get value =>
      controllers.map((controller) => controller.text).join();

  /// Returns `true` if all OTP fields are filled.
  bool get isComplete =>
      controllers.every((controller) => controller.text.isNotEmpty);

  /// Clears all OTP input fields
  /// and moves focus to the first field.
  void clear() {
    for (final controller in controllers) {
      controller.clear();
    }
    focusNodes.first.requestFocus();
  }

  /// Disposes all controllers and focus nodes.
  ///
  /// This should be called when the controller
  /// is no longer needed to avoid memory leaks.
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }

    for (final node in focusNodes) {
      node.dispose();
    }
  }
}