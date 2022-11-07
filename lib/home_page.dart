import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int day = 0811;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello Hardik $day"),
      ),
    );
  }
}
