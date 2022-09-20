import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int bday = 26;
  final String name = "Hardik";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome $bday $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
