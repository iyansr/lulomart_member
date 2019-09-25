import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:lulomart_member/models/product.dart';
import 'package:lulomart_member/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RekomendasiGrid extends StatelessWidget {
  final List<Product> product;

  RekomendasiGrid({Key key, this.product}) : super(key: key);

  Container getStructuredGridCell(Product product) {
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

    return Container(
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Card(
            child: CachedNetworkImage(
              placeholder: (c, img) => Image.asset(
                'images/loading.gif',
                height: 50,
                width: 50,
              ),
              imageUrl: 'https://www.lulomart.com/inventory/upload/product/' +
                  product.picture,
              height: 80,
              width: 60,
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            product.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
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
      crossAxisCount: 3,
      childAspectRatio: 1 / 1,
      children: List.generate(6, (index) {
        return getStructuredGridCell(product[index]);
      }),
    );
  }
}
