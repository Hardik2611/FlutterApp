import 'package:flutter/material.dart';
import 'package:mess_menu/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.p8.color(MyTheme.creamColor).make().p8().w40(context);
  }
}