import 'package:flutter/material.dart';
import 'package:stockin/pages/detailGudang.dart';
import 'package:stockin/pages/detailpage.dart';
import 'package:stockin/pages/homepage.dart';
import 'package:stockin/pages/loginpage.dart';
import 'package:stockin/pages/settingpage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: homepage(),
    );
  }
}
