import 'package:flutter/material.dart';
import 'package:mess_menu/core/store.dart';
import 'package:mess_menu/models/cart.dart';
import 'package:mess_menu/pages/cart_success.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(Colors.black).make(),
      ),
      body: Column(
          children: [
            _CartList().p32().expand(),
            Divider(),
            _CartTotal(),
          ],
        ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, _store, _status){
              return "\u20B9${_cart.totalPrice}"
                  .text
                  .xl4
                  .color(context.theme.accentColor)
                  .make();
            },
            ),
          30.widthBox,
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyCard(title: 'Invoice', description: 'Stay Hungry')));
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: "Not yet done.".text.make(),
            // ));
          },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)
              ),
              child: "Buy".text.color(Colors.white).make()).w32(context)
        ],
      ),
    );
  }
}


class _CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ?"Nothing to show".text.xl3.makeCentered()
    : ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            RemoveMutation(_cart.items[index]);
          }
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}
