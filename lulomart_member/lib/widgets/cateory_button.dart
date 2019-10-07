import 'package:flutter/material.dart';
import 'package:lulomart_member/models/fetch_api.dart';
import 'package:lulomart_member/models/kategori_list.dart';
import 'package:lulomart_member/models/kategory.dart';
import 'package:lulomart_member/utils/styles.dart';
import 'package:lulomart_member/widgets/kategori_grid.dart';
import 'package:http/http.dart' as http;

class CategoryBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Styles _fontStyle = Styles();
    List<Kategori> _kt;

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
            // height: 50,
            // width: 100,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: FutureBuilder(
                future: fetchKategori(http.Client()),
                builder: (context, snapshot) {
                  _kt = snapshot.data;
                  if (snapshot.hasData) {
                    return KategoriGrid(
                      kategori: snapshot.data,
                      len: _kt.length,
                      onTap: () {},
                    );
                  }
                  return CircularProgressIndicator();
                }),
          ),
        ],
      ),
    );
  }
}
