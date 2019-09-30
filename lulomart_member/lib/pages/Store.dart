import 'package:flutter/material.dart';
import 'package:lulomart_member/models/fetch_api.dart';
import 'package:lulomart_member/models/product.dart';
import 'package:lulomart_member/utils/styles.dart';
import 'package:lulomart_member/widgets/outlet_card.dart';
import 'package:http/http.dart' as http;
import 'package:lulomart_member/widgets/rekomendasi_grid.dart';
import 'package:lulomart_member/widgets/store_stacked_widget.dart';

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _fontStyle = Styles();
    //============ Build ===================

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StackedWidget(),
            SizedBox(
              height: 90,
            ),
            OutletCard(),

            Container(
              height: 9,
              color: Colors.grey[50],
            ),

            FutureBuilder<List<Product>>(
              future: fetchProduct(http.Client()),
              builder: (c, snap) {
                return snap.connectionState == ConnectionState.done
                    ? snap.hasData
                        ? Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, top: 16.0, right: 16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Rekomendasi',
                                        style: _fontStyle.boldText(),
                                      ),
                                      Text(
                                        'Lihat Semua',
                                        style: _fontStyle.linkText(),
                                      ),
                                    ],
                                  ),
                                ),
                                RekomendasiGrid(
                                  product: snap.data,
                                ),
                              ],
                            ),
                          )
                        : InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Text("ERROR OCCURRED, Tap to retry !"),
                            ),
                            onTap: () {})
                    : Container(
                        color: Colors.white,
                        height: 300,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 64),
                          alignment: Alignment.topCenter,
                          child: CircularProgressIndicator(),
                        ),
                      );
              },
            )
            // =========== Product End ===================
          ],
        ),
      ),
    );
  }
}
