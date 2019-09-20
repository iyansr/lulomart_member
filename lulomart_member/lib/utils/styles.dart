import 'package:flutter/material.dart';

class Styles {
  TextStyle boldText() {
    return TextStyle(
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle boldTextWhite() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle textWhite() {
    return TextStyle(
      color: Colors.white,
    );
  }

  TextStyle linkText() {
    return TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle linkTextNormal() {
    return TextStyle(
      color: Colors.red,
    );
  }
}
