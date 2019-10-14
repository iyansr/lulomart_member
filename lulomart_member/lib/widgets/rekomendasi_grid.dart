import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:lulomart_member/models/rekomendasi.dart';
import 'package:lulomart_member/ui/colors.dart';
import 'package:lulomart_member/utils/styles.dart';

class RekomendasiGrid extends StatelessWidget {
  final List<Rekomendasi> rekomendasi;

  RekomendasiGrid({Key key, this.rekomendasi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Styles _fontStyle = Styles();

    return Container(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Rekomendasi',
                    style: _fontStyle.boldText(),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Lihat Semua',
                      style: _fontStyle.linkText(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 160,
            // width: 100,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
                    amount: double.parse(rekomendasi[index].price),
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
                    // height: 100,
                    width: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CachedNetworkImage(
                              errorWidget: (c, u, o) => Text('error'),
                              placeholder: (c, img) => Image.asset(
                                'images/loading.gif',
                                height: 80,
                                width: 110,
                              ),
                              imageUrl:
                                  'https://www.lulomart.com/inventory/upload/product/' +
                                      rekomendasi[index].picture,
                              height: 80.0,
                              width: 110.0,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              rekomendasi[index].name,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              fmf.output.symbolOnLeft,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
