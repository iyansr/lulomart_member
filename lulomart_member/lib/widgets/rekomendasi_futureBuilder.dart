import 'package:flutter/material.dart';
import 'package:lulomart_member/models/fetch_api.dart';
import 'package:lulomart_member/models/rekomendasi.dart';
import 'package:http/http.dart' as http;
import 'package:lulomart_member/ui/colors.dart';
import 'package:lulomart_member/utils/styles.dart';
import 'package:lulomart_member/widgets/rekomendasi_grid.dart';

Widget futureRekomendasi(BuildContext context) {
  return FutureBuilder<List<Rekomendasi>>(
    future: fetchRekomen(http.Client()),
    builder: (_, snap) {
      return snap.connectionState == ConnectionState.done
          ? snap.hasData
              ? Container(
                  color: scaffoldBg,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, bottom: 8.0, right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Rekomendasi',
                              style: Styles().boldText(),
                            ),
                            Text(
                              'Lihat Semua',
                              style: Styles().linkText(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: RekomendasiGrid(
                          rekomendasi: snap.data,
                        ),
                      ),
                    ],
                  ),
                )
              : InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text("ERROR OCCURRED, Tap to retry !"),
                  ),
                  onTap: () {
                    fetchProduct(http.Client());
                  })
          : Container(
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
