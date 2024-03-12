import 'package:flutter/material.dart';

import '../Widget/InputField.dart';
import '../Widget/QrWidget.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  late TextEditingController controller;
  String data = "";
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            InputField(
              controller: controller,
              generateQR: () => generateQrCode(),
            ),
            const SizedBox(
              height: 200,
            ),
            QrWidget(data: controller.text),
          ],
        ),
      ),
    );
  }

  generateQrCode() {
    setState(() {
      data = controller.text;
    });
    if (data.isEmpty) {
      buildErrorLayout(context, "Enter data to generate");
    }
  }

  ScaffoldFeatureController buildErrorLayout(context, data) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data)));
}
