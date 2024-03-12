import 'package:flutter/material.dart';

class AthkarPage extends StatefulWidget {
  const AthkarPage({super.key});

  @override
  State<AthkarPage> createState() => _AthkarPageState();
}

class _AthkarPageState extends State<AthkarPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Athkar PAge"),
        ),
      ),
    );
  }
}
