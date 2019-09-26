import 'package:flutter/material.dart';
import 'package:lulomart_member/utils/styles.dart';
import 'package:lulomart_member/widgets/cart_item.dart';

class CartOutlet extends StatelessWidget {
  final String outlet;
  CartOutlet({@required this.outlet});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(outlet, style: Styles().boldText()),
          ),
          CartItem(itemCount: 2),
          Container(height: 9, color: Colors.grey[50]),
        ],
      ),
    );
  }
}
