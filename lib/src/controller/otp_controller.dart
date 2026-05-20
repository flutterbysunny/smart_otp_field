import 'package:flutter/material.dart';

class OtpController {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final int length;

  OtpController({this.length = 6})
      : controllers =
  List.generate(length, (_) => TextEditingController()),
        focusNodes = List.generate(length, (_) => FocusNode());

  String get value =>
      controllers.map((controller) => controller.text).join();

  void clear() {
    for (final controller in controllers) {
      controller.clear();
    }
    focusNodes.first.requestFocus();
  }

  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    for (final node in focusNodes) {
      node.dispose();
    }
  }

  bool get isComplete =>
      controllers.every((controller) => controller.text.isNotEmpty);
}