import 'package:flutter/material.dart';
import 'package:lulomart_member/models/kategori_list.dart';
import 'package:lulomart_member/utils/styles.dart';

class CategoryBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    KategoriList _kategori = KategoriList();
    Styles _fontStyle = Styles();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
            height: 50,
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
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Text('${_kategori.kategori[id]['nama']}'),
                ),

                // RaisedButton(
                //   color: Colors.red,
                //   onPressed: () {},
                //   child: Text(
                //     '${_kategori.kategori[id]['nama']}',
                //     style: _fontStyle.textWhite(),
                //   ),
                // ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
