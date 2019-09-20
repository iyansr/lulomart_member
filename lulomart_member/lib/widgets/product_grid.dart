import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lulomart_member/models/product.dart';

class ProductGridView extends StatelessWidget {
  final List<Product> product;

  ProductGridView({Key key, this.product}) : super(key: key);

  Card getStructuredGridCell(Product product) {
    return Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Image.network(
              'https://www.lulomart.com/inventory/upload/product/' +
                  product.picture,
              height: 130.0,
              width: 100.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(product.name),
                  Text(product.price),
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      primary: true,
      crossAxisCount: 2,
      childAspectRatio: 0.80,
      children: List.generate(product.length, (index) {
        return getStructuredGridCell(product[index]);
      }),
    );
  }
}
