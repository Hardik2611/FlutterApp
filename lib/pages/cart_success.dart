import 'package:flutter/material.dart';
import 'package:mess_menu/core/store.dart';
import 'package:mess_menu/models/cart.dart';
import 'package:mess_menu/pages/home_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String description;

  MyCard({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    var pricing = (_cart.totalPrice).toString();
    var time = DateFormat('EEEE').format(DateTime.now()).toString();
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: title.text.xl5.center.bold.make().py20(),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  "Invoice No.".text.xl3.make().px32(),
                  Random().nextInt(1000).toString().text.xl.make().px64()
                ],
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  "Expected Time".text.xl3.make().px32(),
                  Random().nextInt(30).toString().text.xl.make().px32()
                ],
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  "Invoice No.".text.xl3.make().px32(),
                  time.text.xl.makeCentered().px32(),
                ],
              ),
              SizedBox(height: 46,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  "Total (in Rs.)".text.xl3.bold.make().px32(),
                  pricing.text.xl.makeCentered().px64(),
                ],
              ),
              SizedBox(height: 20,),

              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: "Back to Home".text.xl3.makeCentered(),
              ),
            ],
          ),
        ],


      ),
    );
  }
}