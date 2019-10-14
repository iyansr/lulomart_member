import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/models/fetch_api.dart';
import 'package:lulomart_member/models/generasi1.dart';
import 'package:lulomart_member/ui/colors.dart';

import 'package:http/http.dart' as http;
import 'package:lulomart_member/widgets/generasi1_list.dart';

class Generasi extends StatelessWidget {
  final String gen;
  Generasi({this.gen});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        leading: IconButton(
          // color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            size: 20,
          ),
        ),
        title: Text(
          'Generasi $gen',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(58),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: GestureDetector(
              onTap: () {
                print('appbar');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white,
                ),
                height: 36.0,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.search,
                        color: primaryColor,
                        size: 16.0,
                      ),
                      SizedBox(width: 16.0),
                      Text(
                        'Cari Generasi',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
        child: FutureBuilder<List<Generasi1>>(
          future: fetchG1(http.Client()),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              if (snap.hasData) {
                return Generasi1List(generasi1: snap.data);
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
