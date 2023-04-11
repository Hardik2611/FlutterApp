import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mess_menu/core/store.dart';
import 'package:mess_menu/models/cart.dart';
import 'package:mess_menu/models/catalog.dart';
import 'package:mess_menu/utils/routes.dart';
import 'package:mess_menu/widgets/home_widgets/catalog_header.dart';
import 'package:mess_menu/widgets/home_widgets/catalog_list.dart';
import 'package:mess_menu/widgets/home_widgets/catalog_name.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int day = 0811;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async{
    await Future.delayed(const Duration(seconds: 5));
    final catalogJson =
    await rootBundle.loadString("assets/files/catalog.json");


    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    }


  Widget build(BuildContext context) {
    // final dummyList = List.generate(5, (index) => CatalogModel.items[0]);
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder:(ctx,_,VxState) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context,MyRoutes.cartRoute),
            backgroundColor: context.theme.buttonColor,
            child: Icon(CupertinoIcons.cart,color: Colors.white,)).badge(color: Vx.red500, size: 22, count: _cart.items.length, textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)),
      ),
      body: Padding(

        padding: EdgeInsets.all(8.0),
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              CatalogHeader(),
              CatalogName(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                  const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}









