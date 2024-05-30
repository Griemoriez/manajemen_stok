import 'package:flutter/material.dart';


class LoginCardLayout extends StatelessWidget {
  final List<Widget> children;
  const LoginCardLayout({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(),
          width: 6.0
        ),
        borderRadius: BorderRadius.circular(30.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children
        ),
      ),
    );
  }
}