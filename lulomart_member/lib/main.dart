import 'package:flutter/material.dart';
// import 'package:lulomart_member/pages/Home.dart';
import 'package:lulomart_member/pages/Login.dart';
import 'package:flutter/services.dart';

void main() => runApp(LuloMartMember());

class LuloMartMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lulo Mart Member App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.red,
      ),
      /**
       * Halaman Utama Saat Membuka App => Login()
       * Lokasi : pages/Login.dart 
       */
      home: Login(),
    );
  }
}
