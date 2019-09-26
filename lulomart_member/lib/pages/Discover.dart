import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/models/fetch_api.dart';
import 'package:lulomart_member/models/product.dart';
import 'package:lulomart_member/utils/styles.dart';
import 'package:lulomart_member/widgets/cateory_button.dart';
import 'package:lulomart_member/widgets/product_grid.dart';
import 'package:http/http.dart' as http;

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  int len = 6;
  List<Product> _pr;

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _getMoreData();
  }

  void _getMoreData() {
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        setState(() {
          if (len > _pr.length) {
            len = _pr.length;
          }
          len = len + 6;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Styles _style = Styles();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.search),
            color: Colors.black87,
            iconSize: 20,
          )
        ],
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Discover Product',
          style: _style.boldText20black(),
        ),
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: <Widget>[
              CategoryBtn(),
              Container(
                height: 9,
                color: Colors.grey[50],
              ),
              FutureBuilder<List<Product>>(
                future: fetchProduct(http.Client()),
                builder: (c, snap) {
                  if (snap.connectionState == ConnectionState.done) {
                    if (snap.hasData) {
                      _pr = snap.data;
                      return Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, top: 16.0, bottom: 8.0),
                              child: Text(
                                'Snack',
                                style: _style.boldText(),
                              ),
                            ),
                            ProductGridView(
                              len: len,
                              product: snap.data,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Text("ERROR OCCURRED, Tap to retry !"),
                        ),
                        onTap: () => setState(() {}),
                      );
                    }
                  }

                  return Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
