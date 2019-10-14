import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/ui/colors.dart';
import 'package:lulomart_member/widgets/generasi_card_futureBuilder.dart';

class GenerasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _totalGen = [
      '25',
      '625',
      '225',
    ];

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
          'Generasi',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GenerasiCardFuture(),
      ),
    );
  }
}
