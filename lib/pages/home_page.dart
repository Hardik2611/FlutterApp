import 'dart:convert';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mess_menu/models/catalog.dart';
import 'package:mess_menu/widgets/drawer.dart';

// import '../widgets/item_widget.dart';

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
    return Scaffold(
      appBar: AppBar(title:const Text("NMIMS")),
      body:(CatalogModel.items != null && CatalogModel.items.isNotEmpty)?
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16
              ),
              itemBuilder: (context, index){
                final item= CatalogModel.items[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: GridTile(
                    header: Container(
                        child: Text(
                          item.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Colors.deepPurple),),
                    child: Image.network(item.image),
                    footer: Container(
                      child: Text(
                        item.price.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Colors.deepPurple),),
                  ),
                );
              },
              itemCount: CatalogModel.items.length,
          )
      // ListView.builder(
      //        itemCount: CatalogModel.items.length,
      //        itemBuilder: (BuildContext context, int index) {
      //          return ItemWidget(
      //          item: CatalogModel.items[index],
      //          );
      //      },
    // )
        :const Center(
        child: CircularProgressIndicator(),
      ),
      drawer: const MyDrawer(),
    );
  }
}
