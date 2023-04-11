

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_menu/pages/login_page.dart';
import 'package:http/http.dart' as http;


class CatalogName extends StatelessWidget {
  const CatalogName({Key? key}) : super(key: key);


  Future getContactData(BuildContext context)async{
    var url = 'http://10.168.32.183/flutterApp/login.php';
    var response = await http.get(Uri.parse(url));
    print(username.text);
  }


  Widget build(BuildContext context) {
    return
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Hello,  "+username.text, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
      ],
    );
  }
}