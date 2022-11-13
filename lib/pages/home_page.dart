import 'dart:convert';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mess_menu/models/catalog.dart';
import 'package:mess_menu/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
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
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    print(productsData);
    }


  Widget build(BuildContext context) {
    final dummyList = List.generate(5, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(title:const Text("NMIMS")),
      body: ListView.builder(
             itemCount: dummyList.length,
             itemBuilder: (BuildContext context, int index) {
               return ItemWidget(
               item: dummyList[index],
               );
           },
    ),
      drawer: const MyDrawer(),
    );
  }
}
