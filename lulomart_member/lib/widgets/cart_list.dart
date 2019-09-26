import 'package:flutter/material.dart';
import 'package:lulomart_member/widgets/cart_outlet.dart';

class CartList {
  listCart(BuildContext context) {
    List<Widget> list = [
      CartOutlet(outlet: 'Outlet 1'),
      CartOutlet(outlet: 'Outlet 2'),
      Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text('Alamat Pengantaran : '),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text('Jl. Supu Yusuf'),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              'https://northstar-pres.com/wp-content/uploads/2015/10/google-map-placeholder.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.only(top: 10.0),
        height: 100,
        color: Colors.transparent,
      ),
    ];
    return Column(
      children: list,
    );
  }
}
