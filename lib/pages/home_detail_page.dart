import 'package:flutter/material.dart';
import 'package:mess_menu/models/catalog.dart';
import 'package:mess_menu/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);
final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.xl3.make(),
            ElevatedButton(
              onPressed: (){},
              child: "Buy".text.xl.make(),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder())
              ),).wh(100, 50)
          ],
        ),
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        bottom: false,

        child: Column(
          children: [
            Hero(tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)).h32(context),
            Expanded(child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.bold.make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    10.heightBox,
                  ],
                ).py32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
