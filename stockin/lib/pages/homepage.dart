import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color('2B314A'),
        appBar: AppBar(
          title: Text("Manajemen Stok"),
          backgroundColor: Colors.transparent,
        ),
        ),
    );
  }
}