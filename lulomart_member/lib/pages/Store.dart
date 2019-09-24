import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/models/fetch_api.dart';
import 'package:lulomart_member/models/product.dart';
import 'package:lulomart_member/utils/store_function.dart';
import 'package:lulomart_member/utils/styles.dart';
import 'package:lulomart_member/widgets/outlet_card.dart';
import 'package:lulomart_member/widgets/product_grid.dart';
import 'package:http/http.dart' as http;

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  ScrollController _scrollController;
  //Set Warna Statusbar

  StoreFunction _storeFn = StoreFunction();
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

  _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
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
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                //Gambar Leading

                Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  child: Opacity(
                    opacity: 0.4,
                    child: _storeFn.setGambarAtas(),
                  ),
                ),

                Positioned(
                  top: 90,
                  right: 8,
                  left: 8,
                  child: Container(
                    height: 130,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Jumlah Point Anda Saat Ini :',
                                      style: _fontStyle.boldText(),
                                    ),
                                    Text(
                                      '6.915',
                                      style: _fontStyle.boldText(),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Tambah Point',
                                    style: _fontStyle.linkText(),
                                  ),
                                ),
                              ],
                            ),
                            Image.asset('images/storefront.png',
                                fit: BoxFit.cover)
                          ],
                        ), //Text('Hello'),
                      ),
                    ),
                  ),
                ),

                //Text Greetings
                Positioned(
                  top: 50,
                  right: 20,
                  left: 20,
                  child: _storeFn.setTextAtas(),
                ),
                //Card Atas
              ],
            ),
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
                switch (snap.connectionState) {
                  case ConnectionState.none:
                    break;
                  case ConnectionState.waiting:
                    return Container(
                        color: Colors.white,
                        height: 300,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 64),
                          alignment: Alignment.topCenter,
                          child: CircularProgressIndicator(),
                        ));
                    break;
                  default:
                    return Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, top: 16.0),
                            child: Text(
                              'Rekomendasi',
                              style: _fontStyle.boldText(),
                            ),
                          ),
                          ProductGridView(
                            product: snap.data,
                          ),
                        ],
                      ),
                    );
                }
              },
            )
            // =========== Product End ===================
          ],
        ),
      ),
    );
  }
}
