import 'package:classico/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset("assets/images/login_image.png"),
            const SizedBox(
              height: 20.0,
            ),
            Text("Welcome $name", style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Username cannot be empty.";
                        }
                        return null;
                      },
                      onChanged: (value){
                        name = value;
                        setState(() {});
                      },
                    ),

                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Password cannot be empty.";
                        }else if (value.length < 6){
                          return "Password length should be at least 6.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(changeButton?50:10),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width:changeButton?50:150,
                          height: 40,
                          alignment: Alignment.center,

                          child: changeButton?const Icon(Icons.done,color: Colors.white,):
                          const Text("Login", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                        ),
                      ),
                    )


                    // ElevatedButton(
                    //   style: TextButton.styleFrom(minimumSize: const Size(200, 50)),
                    //     onPressed: () {
                    //     print("Hello hardik");
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //     },
                    //     child: const Text("Login",style: TextStyle(color: Colors.white),),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
