import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/ui/colors.dart';
import 'package:lulomart_member/utils/styles.dart';

Widget storeAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: primaryColor,
    elevation: 0,
    title: Text(
      'Belanja',
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
    bottom: AppBar(
      elevation: 0,
      backgroundColor: primaryColor,
      centerTitle: true,
      title: GestureDetector(
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
  );
}
