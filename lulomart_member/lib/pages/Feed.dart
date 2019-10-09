import 'package:flutter/material.dart';
import 'package:lulomart_member/ui/colors.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text(
          'Feed',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
        ),
      ),
    );
  }
}
