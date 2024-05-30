import 'package:flutter/material.dart';
import 'package:stockin/pages/homepage.dart';

void main() {
  runApp(const homepage());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
