import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/ui/colors.dart';

class RiwayatTransaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        leading: IconButton(
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
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.separated(
            itemCount: 10,
            separatorBuilder: (c, i) => Divider(),
            itemBuilder: (context, i) => Container(
              child: ListTile(
                onTap: () {},
                title: Text('2018-10-16 19:12:23'),
                subtitle: Text('Total : Rp. 20.000'),
                trailing: Icon(
                  FontAwesomeIcons.chevronRight,
                  size: 16,
                ),
              ),
            ),
            shrinkWrap: true,
          ),
        ),
      ),
    );
  }
}
