import 'package:flutter/material.dart';
import 'package:orderly/models/order.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  OrderTile({this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Card(
        margin: EdgeInsets.fromLTRB(18, 8, 18, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green[order.amount],
          ),
          title: Text(order.name),
          subtitle: Text('Wants ${order.type} for ${order.amount}\$'),
        ),
      ),
    );
  }
}
