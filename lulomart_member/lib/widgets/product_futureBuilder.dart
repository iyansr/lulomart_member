import 'package:flutter/material.dart';
import 'package:lulomart_member/models/fetch_api.dart';
import 'package:lulomart_member/models/product.dart';

import 'package:http/http.dart' as http;
import 'package:lulomart_member/models/provider.dart';
import 'package:lulomart_member/ui/colors.dart';
import 'package:lulomart_member/utils/styles.dart';
import 'package:lulomart_member/widgets/product_grid.dart';
import 'package:provider/provider.dart';

Widget productFutureBuilder(
    BuildContext context, ScrollController scrollController) {
  Styles _style = Styles();
  List<Product> _pr;

  final _provider = Provider.of<FetchProduct>(context);

  _loadData() => scrollController.addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          _provider.setScrollLen(_pr.length);
        }
      });
  return FutureBuilder<List<Product>>(
    future: fetchProduct(http.Client()),
    builder: (c, snap) {
      if (snap.connectionState == ConnectionState.done) {
        if (snap.hasData) {
          _pr = snap.data;
          _loadData();
          return Container(
            color: scaffoldBg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                  child: Text(
                    'Semua Produk',
                    style: _style.boldText(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ProductGridView(
                    len: _provider.scrollLen,
                    product: snap.data,
                  ),
                ),
              ],
            ),
          );
        } else {
          return InkWell(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text("ERROR OCCURRED, Tap to retry !"),
                ),
              ),
              onTap: () {});
        }
      }

      return Container(
        color: scaffoldBg,
        height: 300,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 64),
          alignment: Alignment.topCenter,
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}
