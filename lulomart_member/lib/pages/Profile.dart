import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lulomart_member/pages/GenerasiCard.dart';
import 'package:lulomart_member/pages/Point.dart';
import 'package:lulomart_member/pages/Referal.dart';
import 'package:lulomart_member/pages/RiwayatTransaksi.dart';
import 'package:lulomart_member/pages/Tentang.dart';
import 'package:lulomart_member/ui/colors.dart';
import 'package:lulomart_member/widgets/profile_listTile.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _title = [
      'Riwayat Transaksi',
      'Point',
      'Generasi',
      'Referal Saya',
      'Tentang',
    ];
    List<Widget> _pages = [
      RiwayatTransaksi(),
      PointPage(),
      GenerasiPage(),
      MyReferal(),
      Tentang(),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 48.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                ),
                child: Row(
                  children: <Widget>[
                    CircularProfileAvatar(
                      'https://www.cheatsheet.com/wp-content/uploads/2019/05/robert-downey-jr-avengers-endgame.jpg', //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                      backgroundColor: Colors.transparent,
                      borderWidth: 3,
                      initialsText: Text(
                        "AD",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      borderColor: Colors.red[900],
                      cacheImage: true,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Tony Stark',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Edit Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (_, i) => Divider(),
                itemCount: 5,
                itemBuilder: (_, i) => ProfileListView(
                  title: _title[i],
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) => _pages[i]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
