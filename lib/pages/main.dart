import 'package:flutter/material.dart';
import 'package:mess_menu/core/store.dart';
import 'package:mess_menu/pages/cart_page.dart';
import 'package:mess_menu/pages/home_page.dart';
import 'package:mess_menu/pages/login_page.dart';
import 'package:mess_menu/utils/routes.dart';
import 'package:mess_menu/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main(){
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      theme: MyTheme.lightTheme(context),
        themeMode: ThemeMode.system,
        initialRoute: MyRoutes.loginRoute,
        routes:{
          MyRoutes.homeRoute :(context) => HomePage(),
          MyRoutes.loginRoute :(context) => LoginPage(),
          MyRoutes.cartRoute :(context) => CartPage(),
        }
    );
  }
}
