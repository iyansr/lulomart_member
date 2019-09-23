import 'package:flutter/material.dart';

var time = DateTime.now();
var jam = time.hour;

class StoreFunction {
  Image setGambarAtas() {
    if (jam >= 03 && jam <= 12) {
      return Image.asset(
        'images/pagi.jpg',
        fit: BoxFit.cover,
      );
    }
    if (jam >= 12 && jam <= 18) {
      return Image.asset(
        'images/sore.jpg',
        fit: BoxFit.cover,
      );
    }
    if (jam >= 15 && jam <= 24) {
      return Image.asset(
        'images/malam.jpg',
        fit: BoxFit.cover,
      );
    }
  }

  Text setTextAtas() {
    if (jam >= 01 && jam <= 12) {
      return Text(
        'Good Moring',
        textAlign: TextAlign.center,
      );
    }
    if (jam >= 12 && jam <= 15) {
      return Text(
        'Good Afternoon',
        textAlign: TextAlign.center,
      );
    }
    if (jam >= 15 && jam <= 24) {
      return Text(
        'Good Evening',
        textAlign: TextAlign.center,
      );
    }
    return Text(
      'Good Evening',
      textAlign: TextAlign.center,
    );
  }
}
