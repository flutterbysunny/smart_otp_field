# Smart OTP Field

A beautiful, customizable Flutter OTP input package with controller support, theme customization, auto focus handling, completion callbacks, and resend timer.

[![Flutter](https://img.shields.io/badge/Flutter-Package-blue.svg)]()
[![Platform](https://img.shields.io/badge/platform-Android%20%7C%20iOS-green.svg)]()
[![License](https://img.shields.io/badge/license-MIT-orange.svg)]()

---

## ✨ Features

- 🔢 Beautiful OTP input boxes
- 🎯 Auto focus next / previous
- 🎛 OTP controller support
- 🎨 Custom theme support
- 📞 `onChanged` callback
- ✅ `onCompleted` callback
- 🔄 Resend timer widget
- 🧹 Clear OTP programmatically
- 📱 Android & iOS support
- 🚀 Easy integration

---

## 📦 Installation

Add dependency in `pubspec.yaml`

```yaml
dependencies:
  smart_otp_field: ^0.0.1
```

Run:

```bash
flutter pub get
```

---


## 🧩 Full Example

```dart
import 'package:flutter/material.dart';
import 'package:smart_otp_field/smart_otp_field.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final OtpController controller = OtpController(length: 6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OTP Verification")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SmartOtpField(
              controller: controller,
              length: 6,
              onCompleted: (otp) {
                print("OTP Entered: $otp");
              },
            ),

            const SizedBox(height: 20),

            ResendTimer(
              seconds: 30,
              onResend: () {
                print("Resend OTP");
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                print(controller.value);
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## ⚙ Available Properties

### SmartOtpField

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `length` | `int` | `6` | OTP box count |
| `controller` | `OtpController?` | `null` | OTP controller |
| `theme` | `OtpTheme` | `default` | Custom UI theme |
| `onChanged` | `ValueChanged<String>?` | `null` | OTP change callback |
| `onCompleted` | `ValueChanged<String>?` | `null` | Called when OTP complete |

---

### OtpController

| Property | Description |
|----------|-------------|
| `value` | Returns OTP string |
| `clear()` | Clears all boxes |
| `isComplete` | Checks OTP completion |
| `dispose()` | Dispose controllers |

---

### OtpTheme

| Property | Description |
|----------|-------------|
| `boxWidth` | OTP box width |
| `boxHeight` | OTP box height |
| `textStyle` | OTP text style |
| `decoration` | Default box decoration |
| `focusedDecoration` | Focused box decoration |

---

## 📱 Platform Support

| Platform | Support |
|----------|---------|
| Android | ✅ |
| iOS | ✅ |

---

## 📄 License

MIT License

---

## 🤝 Contributing

Pull requests are welcome.

If you find bugs or want improvements, feel free to open an issue.

---

## ⭐ Support

If you like this package, give it a star on GitHub.