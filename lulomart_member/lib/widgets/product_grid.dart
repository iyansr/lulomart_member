import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:lulomart_member/models/product.dart';
import 'package:lulomart_member/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductGridView extends StatelessWidget {
  final List<Product> product;

  ProductGridView({Key key, this.product}) : super(key: key);

  Card getStructuredGridCell(Product product) {
    Styles _fontStyle = Styles();

    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
      amount: double.parse(product.price),
      settings: MoneyFormatterSettings(
        symbol: 'Rp',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 0,
        compactFormatType: CompactFormatType.short,
      ),
    );

    return Card(
      // color: Colors.red,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          CachedNetworkImage(
            placeholder: (c, img) => Image.asset(
              'images/loading.gif',
              height: 130,
              width: 100,
            ),
            imageUrl: 'https://www.lulomart.com/inventory/upload/product/' +
                product.picture,
            height: 130.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  product.name,
                  textAlign: TextAlign.center,
                ),
                Text('${fmf.output.symbolOnLeft}',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          RaisedButton(
            color: Colors.red,
            elevation: 0,
            onPressed: () {},
            child: Text(
              'Beli',
              style: _fontStyle.textWhite(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      primary: true,
      crossAxisCount: 2,
      childAspectRatio: 0.70,
      children: List.generate(product.length, (index) {
        return getStructuredGridCell(product[index]);
      }),
    );
  }
}
