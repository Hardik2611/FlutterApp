import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({Key? key}) : super(key: key);
  var togglecall;
  LoginPage({this.togglecall});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

Future login(BuildContext context) async{

  if(username.text == "" || password.text == ""){
    Fluttertoast.showToast(msg: "Both Fields empty",toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER,fontSize: 16.0);
  }
  else{

    var url = 'http://10.168.35.10/flutterApp/login.php';
    var response = await http.post(Uri.parse(url),
        body: {
          "username" : username.text,
          "password" : password.text,
        });

    var data =json.decode(response.body);
    print(data);
    if (data == username.text){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    else{
      Fluttertoast.showToast(msg: "User does not exist",toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER,fontSize: 16.0);
    }

  }

}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  bool value = true;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    bool value = false;
    return Material(
      child: Column(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(
                          height: 10.0,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Welcome".text.xl4.color(context.theme.buttonColor).fontWeight(FontWeight.bold).make(),
                          ],
                        ),
                        "Admin".text.xl3.color(context.theme.buttonColor).fontWeight(FontWeight.w400).make(),

                        const SizedBox(
                          height: 10.0,
                        ),

                        TextFormField(
                          controller: username,
                          decoration: const InputDecoration(
                              labelText:  "Username",
                              hintText: "Enter Username"
                          ),
                          validator: (value){
                            if(value!.isEmpty || value==null){
                              return "Empty field not allowed";
                            }
                            return null;
                          },
                          // onChanged: (value){
                          //   name = value;
                          //   setState(() {});
                          // },
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),

                        TextFormField(
                          controller: password,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            hintText: "Enter Password",
                          ),
                          obscureText: true,
                          validator: (value){
                            if(value!.isEmpty || value==null){
                              return "Empty field not allowed";
                            }else if(value.length <5){
                              return "length should be more than 5";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 8.0,),


                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                activeColor: Color(0xff00C8E8),
                                value: value,
                                onChanged: (bool? value) {  },
                              ),
                              "Remembe Me".text.make(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0,),

                        Center(

                          child: Material(
                            color: context.theme.buttonColor,
                            borderRadius: BorderRadius.circular(15.0),
                            child: InkWell(
                              onTap: () => login(context),
                              child: AnimatedContainer(
                                width: 150,
                                height: 40,
                                alignment: Alignment.center,
                                duration: const Duration(seconds: 1),
                                child: "Login".text.xl2.color(context.theme.canvasColor).fontWeight(FontWeight.w500).make(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                              child: InkWell(
                                onTap: (){},
                                child: Container(child: Text("Forgot password?",style: TextStyle(fontSize: 13, decoration: TextDecoration.underline),),),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: const Text('AlertDialog Title'),
                                    content: const Text('AlertDialog description'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                ),
                                child: "Contact us".text.color(context.theme.buttonColor).make().p0(),
                              ),
                              "|".text.color(context.theme.buttonColor).make(),
                              TextButton(
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: const Text('AlertDialog Title'),
                                    content: const Text('AlertDialog description'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                ),
                                child: "Request".text.color(context.theme.buttonColor).make().p0(),
                              ),

                              "|".text.color(context.theme.buttonColor).make(),

                              TextButton(
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: const Text('AlertDialog Title'),
                                    content: const Text('AlertDialog description'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                ),
                                child: "Report Issue".text.color(context.theme.buttonColor).make().p0(),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}