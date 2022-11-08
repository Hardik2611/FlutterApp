import 'package:flutter/material.dart';
import 'package:mess_menu/home_page.dart';
import 'package:mess_menu/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily,
      ),
        routes:{
          "/login" :(context) => HomePage(),
          "/" :(context) => LoginPage(),
        }
    );
  }
}
