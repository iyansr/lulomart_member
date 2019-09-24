import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/pages/Generasi.dart';
import 'package:lulomart_member/pages/Point.dart';
import 'package:lulomart_member/pages/Referal.dart';
import 'package:lulomart_member/utils/styles.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Styles _style = Styles();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      // CircleAvatar(
                      //   backgroundColor: Colors.transparent,
                      //   radius: 40,
                      //   backgroundImage: NetworkImage(
                      //       'https://www.cheatsheet.com/wp-content/uploads/2019/05/robert-downey-jr-avengers-endgame.jpg'),
                      // ),
                      CircularProfileAvatar(
                        'https://www.cheatsheet.com/wp-content/uploads/2019/05/robert-downey-jr-avengers-endgame.jpg', //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                        backgroundColor: Colors
                            .transparent, // sets background color, default Colors.white
                        borderWidth: 3, // sets border, default 0.0
                        initialsText: Text(
                          "AD",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ), // sets initials text, set your own style, default Text('')
                        borderColor: Colors
                            .red, // sets border color, default Colors.white
                        elevation:
                            5.0, // sets elevation (shadow of the profile picture), default value is 0.0
                        cacheImage:
                            true, // allow widget to cache image against provided url
                        onTap: () {
                          print('adil');
                        }, // sets on tap
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Tony Stark',
                            style: _style.boldText20(),
                          ),
                          Text(
                            'Edit Profile',
                            style: _style.linkTextNormal(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.all(0),
                  title: Text('Riwayat Transaksi'),
                  trailing: Icon(FontAwesomeIcons.chevronRight, size: 16),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => PointPage(),
                      ),
                    );
                  },
                  contentPadding: EdgeInsets.all(0),
                  title: Text('Point'),
                  trailing: Icon(FontAwesomeIcons.chevronRight, size: 16),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => Generasi(),
                      ),
                    );
                  },
                  contentPadding: EdgeInsets.all(0),
                  title: Text('Generasi'),
                  trailing: Icon(FontAwesomeIcons.chevronRight, size: 16),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => MyReferal(),
                      ),
                    );
                  },
                  contentPadding: EdgeInsets.all(0),
                  title: Text('Referal Saya'),
                  trailing: Icon(FontAwesomeIcons.chevronRight, size: 16),
                ),
                Divider(),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.all(0),
                  title: Text('Tentang Aplikasi'),
                  trailing: Icon(FontAwesomeIcons.chevronRight, size: 16),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
