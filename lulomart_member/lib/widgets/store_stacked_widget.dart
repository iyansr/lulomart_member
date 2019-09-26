import 'package:flutter/material.dart';
import 'package:lulomart_member/utils/store_function.dart';
import 'package:lulomart_member/utils/styles.dart';

class StackedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StoreFunction _storeFn = StoreFunction();
    Styles _fontStyle = Styles();

    return Stack(
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
                    Image.asset('images/storefront.png', fit: BoxFit.cover)
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
    );
  }
}
