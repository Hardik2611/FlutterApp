
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_menu/pages/login_page.dart';
import 'package:mess_menu/pages/orders.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;


class CatalogHeader extends StatelessWidget {
 const CatalogHeader({Key? key}) : super(key: key);


  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            "Canteen".text.xl4.bold.color(context.theme.accentColor).make(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(icon:Icon(Icons.logout_rounded), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                }, color: context.theme.buttonColor,),
                IconButton(icon:Icon(Icons.person_pin, size: 30,), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RecentOrdersPage()),);
                }, color: context.theme.buttonColor,)
              ],
            )
          ],
        ),
      ],
    );
  }
}