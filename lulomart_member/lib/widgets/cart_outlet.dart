import 'package:flutter/material.dart';
import 'package:lulomart_member/widgets/cart_item.dart';

class CartOutlet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Outlet 1'),
          CartItem(itemCount: 2),
        ],
      ),
    );
  }
}
