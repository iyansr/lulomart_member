import 'package:flutter/material.dart';
import 'package:lulomart_member/models/kategory.dart';

class KategoriGrid extends StatelessWidget {
  final List<Kategori> kategori;
  final int len;
  final VoidCallback onTap;

  KategoriGrid({this.kategori, this.len, this.onTap});

  Widget getStructuredGridCell(Kategori kategori) {
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'images/cart.png',
                height: 32,
                width: 32,
              ),
              Text(kategori.name),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      primary: true,
      crossAxisCount: 4,
      childAspectRatio: 1.10,
      children: List.generate(len, (index) {
        return getStructuredGridCell(kategori[index]);
      }),
    );
  }
}
