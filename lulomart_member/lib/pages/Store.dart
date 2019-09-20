import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/models/fetch_api.dart';
import 'package:lulomart_member/models/kategori_list.dart';
import 'package:lulomart_member/models/product.dart';
import 'package:lulomart_member/utils/store_function.dart';
import 'package:lulomart_member/utils/styles.dart';
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
  KategoriList _kategori = KategoriList();
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    //============ Build ===================
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        backgroundColor: Colors.red,
        child: Icon(FontAwesomeIcons.chevronUp),
      ),
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

                //Text Greetings
                Positioned(
                  top: 50,
                  right: 20,
                  left: 20,
                  child: _storeFn.setTextAtas(),
                ),

                //Card Atas
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
              ],
            ),
            SizedBox(height: 100),

            //========== Outlet Start ====================
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Outlet',
                      style: _fontStyle.boldText(),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Lihat Semua',
                        style: _fontStyle.linkTextNormal(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              // width: 100,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  height: 100,
                  width: 100,
                  child: Card(
                    child: Center(
                      child: Text(
                        'Outlet',
                        style: _fontStyle.linkTextNormal(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //========== Outlet End ====================
            SizedBox(height: 20),
            //========== Kategori Start ====================
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Kategori',
                  style: _fontStyle.boldText(),
                ),
              ),
            ),
            Container(
              height: 40,
              // width: 100,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: _kategori.kategori.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, id) => Container(
                    // height: 40,
                    // width: 110,
                    child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () {},
                    child: Text(
                      '${_kategori.kategori[id]['nama']}',
                      style: _fontStyle.textWhite(),
                    ),
                  ),
                )),
              ),
            ),
            //=============== Kategori End ====================
            // =========== Product Start ===================
            FutureBuilder<List<Product>>(
              future: fetchProduct(http.Client()),
              builder: (c, snap) {
                if (snap.hasError) {
                  return snap.error;
                }

                return snap.hasData
                    ? Container(
                        child: ProductGridView(
                          product: snap.data,
                        ),
                      )
                    : Container(
                        height: 100,
                        child: Center(
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
