import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RiwayatTransaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black87,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            size: 20,
          ),
        ),
        title: Text(
          'Riwayat Transaksi',
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
