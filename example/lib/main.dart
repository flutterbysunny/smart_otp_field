import 'package:flutter/material.dart';
import 'package:smart_otp_field_plus/smart_otp_field_plus.dart';

/// Entry point of the example application.
void main() {
  runApp(const MyApp());
}

/// Example application demonstrating the usage
/// of the Smart OTP Field Plus package.
class MyApp extends StatelessWidget {

  /// Creates the example application.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Smart OTP Field"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// OTP input field example.
              SmartOtpFieldPlus(
                length: 6,
                obscureText: false,
                theme: OtpTheme(
                  boxWidth: 55,
                  boxHeight: 55,
                  spacing: 12,
                  borderRadius: BorderRadius.circular(16),
                  borderColor: Colors.grey,
                  focusedBorderColor: Colors.green,
                  borderWidth: 1,
                  focusedBorderWidth: 2,
                  fillColor: Colors.grey.shade100,
                  focusedFillColor: Colors.green.shade50,
                  cursorColor: Colors.green,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                /// Called whenever OTP changes.
                onChanged: (value) {

                },

                /// Called when OTP input is complete.
                onCompleted: (value) {

                },
              ),

              const SizedBox(height: 20),

              /// Resend OTP timer example.
              ResendTimer(
                seconds: 30,

                /// Triggered when resend is tapped.
                onResend: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}