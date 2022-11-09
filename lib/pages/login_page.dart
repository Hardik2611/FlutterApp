import 'package:flutter/material.dart';
import 'package:mess_menu/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override


  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton = false;

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
          Text("Welcome $name",
            style:const TextStyle(fontSize: 25,
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
                    onChanged: (value){
                    name=value;
                    setState(() {

                    });
                    },
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
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changeButton = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width:changeButton? 40 : 150,
                      height: 40,

                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                      color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(changeButton?40:10)
                      ),
                      child:changeButton?const Icon(Icons.done , color: Colors.white,):const Text("Login",
                        style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20,color: Colors.white),
                          ),

                    ),
                  )
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //     },
                  //     style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  //     child: const Text("Login"))
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
