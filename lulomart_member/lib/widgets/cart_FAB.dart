import 'package:flutter/material.dart';
import 'package:lulomart_member/utils/styles.dart';

class CartFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Total : Rp. 10.000',
              style: Styles().boldText(),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Checkout', style: Styles().textWhite()),
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
