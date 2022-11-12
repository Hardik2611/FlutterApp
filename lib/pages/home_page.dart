import 'package:flutter/material.dart';
import 'package:mess_menu/models/catalog.dart';
import 'package:mess_menu/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  int day = 0811;

  @override
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
