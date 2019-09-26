import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/widgets/generasiCard_card.dart';
import 'package:lulomart_member/widgets/point_card.dart';

class GenerasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Point Saya',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: <Widget>[
            GenerasiCardWidget(color: Colors.blue, gen: 1),
            GenerasiCardWidget(color: Colors.blue, gen: 2),
            GenerasiCardWidget(color: Colors.blue, gen: 3),
          ],
        ),
      ),
    );
  }
}
