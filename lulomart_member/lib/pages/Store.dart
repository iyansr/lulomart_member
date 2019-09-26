import 'package:flutter/material.dart';
import 'package:lulomart_member/models/fetch_api.dart';
import 'package:lulomart_member/models/product.dart';
import 'package:lulomart_member/utils/styles.dart';
import 'package:lulomart_member/widgets/outlet_card.dart';
import 'package:http/http.dart' as http;
import 'package:lulomart_member/widgets/product_grid.dart';
import 'package:lulomart_member/widgets/rekomendasi_grid.dart';
// import 'package:lulomart_member/widgets/product_grid_rekomendasi.dart';
import 'package:lulomart_member/widgets/store_stacked_widget.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  ScrollController _scrollController;
  //Set Warna Statusbar

  Styles _fontStyle = Styles();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //============ Build ===================
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
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
            // CategoryBtn(),
            // SizedBox(height: 8),

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
                            onTap: () => setState(() {}))
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
