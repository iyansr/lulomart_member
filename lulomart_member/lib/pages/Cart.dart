import 'package:flutter/material.dart';
import 'package:lulomart_member/utils/styles.dart';
import 'package:lulomart_member/widgets/cart_FAB.dart';
import 'package:lulomart_member/widgets/cart_list.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartList _cartList = CartList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CartFAB(),
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
          child: _cartList.listCart(context),
        ),
      ),
    );
  }
}
