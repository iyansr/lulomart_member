import 'package:flutter/material.dart';
import 'package:lulomart_member/models/kategory.dart';
import 'package:lulomart_member/ui/colors.dart';

class KategoriGrid extends StatelessWidget {
  final List<Kategori> kategori;
  final int len;
  final VoidCallback onTap;

  KategoriGrid({this.kategori, this.len, this.onTap});

  Widget getStructuredGridCell(Kategori kategori) {
    return Card(
      color: primaryColor,
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            kategori.name,
            style: TextStyle(
              color: scaffoldBg,
              fontWeight: FontWeight.w700,
            ),
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
      childAspectRatio: 1.1,
      children: List.generate(len, (index) {
        return getStructuredGridCell(kategori[index]);
      }),
    );
  }
}
