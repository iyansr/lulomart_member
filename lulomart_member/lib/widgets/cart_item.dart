import 'package:flutter/material.dart';
import 'package:lulomart_member/ui/colors.dart';

class CartItem extends StatelessWidget {
  final int itemCount;
  CartItem({this.itemCount});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, i) {
          return Card(
            elevation: 0,
            child: ListTile(
              leading: Container(
                height: 80,
                width: 80,
                color: primaryColor,
              ),
              title: Text('Waver Nabati'),
              subtitle: Text('20.000'),
            ),
          );
        },
      ),
    );
  }
}
