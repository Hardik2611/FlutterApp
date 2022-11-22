import 'package:flutter/material.dart';
import 'package:mess_menu/pages/cart_page.dart';
import 'package:mess_menu/pages/home_page.dart';
import 'package:mess_menu/pages/login_page.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:mess_menu/utils/routes.dart';
import 'package:mess_menu/widgets/themes.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: MyTheme.darkTheme(context),
      theme: MyTheme.lightTheme(context),
        initialRoute: MyRoutes.homeRoute,
        routes:{
          MyRoutes.homeRoute :(context) => HomePage(),
          MyRoutes.loginRoute :(context) => LoginPage(),
          MyRoutes.cartRoute :(context) => CartPage(),
        }
    );
  }
}
