import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/ui/colors.dart';

Widget storeAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: primaryColor,
    elevation: 0,
    title: Text(
      'LuloMart',
      style: TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.w700,
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(FontAwesomeIcons.solidBell),
        onPressed: () {},
      )
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(58),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
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
                    'Cari Produk',
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
  );
}
