import 'package:flutter/material.dart';
import 'package:lulomart_member/utils/styles.dart';
import 'package:lulomart_member/widgets/cart_item.dart';
import 'package:lulomart_member/widgets/cart_outlet.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Daftar Belanja',
          style: Styles().boldText20black(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              CartOutlet(),
            ],
          ),
        ),
      ),
    );
  }
}
