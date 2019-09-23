import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/pages/Point.dart';
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
                      Container(
                        width: 120.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://www.meme-arsenal.com/memes/4707e9844b35bf2fbddaf86d7d43470c.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          border: Border.all(
                            color: Colors.red,
                            width: 3.0,
                          ),
                        ),
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
                  onTap: () {},
                  contentPadding: EdgeInsets.all(0),
                  title: Text('Generasi'),
                  trailing: Icon(FontAwesomeIcons.chevronRight, size: 16),
                ),
                Divider(),
                ListTile(
                  onTap: () {},
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
