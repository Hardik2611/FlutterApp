import 'package:flutter/material.dart';

class RecentOrdersPage extends StatefulWidget {
  @override
  _RecentOrdersPageState createState() => _RecentOrdersPageState();
}

class _RecentOrdersPageState extends State<RecentOrdersPage> {
  List<Order> _orders = [
    Order(
      id: 1,
      customerName: 'John Doe',
      orderDate: DateTime.now().subtract(Duration(days: 2)),
      items: [
        OrderItem(name: 'Product A', price: 10.0, quantity: 1),
        OrderItem(name: 'Product B', price: 20.0, quantity: 1),
      ],
    ),
    Order(
      id: 2,
      customerName: 'Jane Smith',
      orderDate: DateTime.now().subtract(Duration(days: 1)),
      items: [
        OrderItem(name: 'Product C', price: 15.0, quantity:1),
      ],
    ),
    Order(
      id: 3,
      customerName: 'Bob Johnson',
      orderDate: DateTime.now(),
      items: [
        OrderItem(name: 'Product D', price: 25.0, quantity: 1),
        OrderItem(name: 'Product E', price: 30.0, quantity: 1),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent Orders', style: TextStyle(color: Colors.black),),
      ),
      body: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final order = _orders[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    'Order #${order.id}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Customer: ${order.customerName}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '\u20B9${order.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Ordered on ${_formatDate(order.orderDate)}',
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: order.items
                        .map((item) => Text(
                      '${item.quantity}x ${item.name} @ \$${item.price}',
                      style: TextStyle(fontSize: 16.0),
                    ))
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    final monthNames = <int, String>{
      1: 'January',
      2: 'February',
      3: 'March',
      4: 'April',
      5: 'May',
      6: 'June',
      7: 'July',
      8: 'August',
      9: 'September',
      10: 'October',
      11: 'November',
      12: 'December',
    };
    return '${monthNames[date.month]} ${date.day}, ${date.year}';
  }
}

class Order {
  final int id;
  final String customerName;
  final DateTime orderDate;
  final List<OrderItem> items;

  Order({
  required this.id,
  required this.customerName,
  required this.orderDate,
  required this.items,
  });

  double get totalPrice {
    return items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }
}

class OrderItem {
  final String name;
  final double price;
  final int quantity;

  OrderItem({required this.name, required this.price, required this.quantity});
}