import 'package:flutter/material.dart';
import 'package:mess_menu/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()){
    setState(() {changeButton = true;});
    await Future.delayed(const Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {changeButton = false;});}
  }

@override
  Widget build(BuildContext context) {
    return Material(

      color: context.theme.canvasColor,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
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

                  child: Column(
                    children: [
                      TextFormField(decoration: const InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                        validator: (value) {
                        if(value!.isEmpty){
                          return "Username can't be empty.";
                        }
                        return null;
                        },
                        onChanged: (value){
                        name=value;
                        setState(() {});
                        },
                      ),

                      TextFormField(decoration: const InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                        obscureText: true,
                        validator: (value){
                        if(value==null && value!.isEmpty){
                          return "Password can't be empty";
                        }else
                        if(value.length<6){
                          return "Password length should be atleast 6.";
                        }
                        return null;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Material(
                        color: context.theme.buttonColor,
                        borderRadius: BorderRadius.circular(changeButton?40:10),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width:changeButton? 40 : 150,
                            height: 40,
                            alignment: Alignment.center,
                            child:changeButton?const Icon(Icons.done , color: Colors.white,):const Text("Login",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 20,color: Colors.white),
                                ),

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

            ],
          ),
        ),
      )
    );
  }
}
