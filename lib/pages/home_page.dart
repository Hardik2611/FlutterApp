import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int day = 0811;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("NMIMS")),
      body: Center(
        child: Text("Hello Hardik $day"),
      ),
      drawer: Drawer(),
    );
  }
}
