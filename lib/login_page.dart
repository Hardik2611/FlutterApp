import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png"),
          const SizedBox(
            height: 20,
          ),
          const Text("Welcome",
            style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(decoration: const InputDecoration(
                    hintText: "Enter username",
                    labelText: "Username",
                  ),
                  ),

                  TextFormField(decoration: const InputDecoration(
                    hintText: "Enter password",
                    labelText: "Password",
                  ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print("Hello");
                      },
                      style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      child: const Text("Login"))
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
