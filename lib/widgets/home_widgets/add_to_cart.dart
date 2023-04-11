import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_menu/core/store.dart';
import 'package:mess_menu/models/cart.dart';
import 'package:mess_menu/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';



class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key, required this.catalog,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final CartModel _cart = (VxState.store as MyStore).cart;
    VxState.watch(context,on: [AddMutation, RemoveMutation]);
    bool isInCart = _cart.items.contains(catalog) ;
    return ElevatedButton(
      onPressed: (){
        if(!isInCart){
          AddMutation(catalog);
        }
      },
      child: isInCart? Icon(Icons.done, color: Colors.white,): Icon(CupertinoIcons.cart_badge_plus, color: Colors.white,),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())
      ),);
  }
}