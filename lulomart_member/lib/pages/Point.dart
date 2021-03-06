import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/ui/colors.dart';
import 'package:lulomart_member/widgets/point_card.dart';

class PointPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Point Saya',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: <Widget>[
            PointCard(color: Colors.blue),
            PointCard(color: Colors.yellow, textColor: Colors.black87),
            PointCard(color: Colors.green),
            PointCard(color: Colors.red),
          ],
        ),
      ),
    );
  }
}
