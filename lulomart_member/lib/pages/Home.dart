import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/pages/Discover.dart';
import 'package:lulomart_member/pages/Profile.dart';
import 'package:lulomart_member/pages/Store.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Store(),
            Discover(),
            Container(
              color: Colors.blue,
            ),
            Profile(),
          ],
        ),
        bottomNavigationBar: Container(
          height: 55,
          child: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Home',
                icon: Icon(
                  FontAwesomeIcons.home,
                  size: 18,
                ),
              ),
              Tab(
                text: 'Belanja',
                icon: Icon(
                  FontAwesomeIcons.compass,
                  size: 18,
                ),
              ),
              Tab(
                text: 'Chart',
                icon: Icon(
                  FontAwesomeIcons.shoppingBag,
                  size: 18,
                ),
              ),
              Tab(
                text: 'Profile',
                icon: Icon(
                  FontAwesomeIcons.userAlt,
                  size: 18,
                ),
              ),
            ],
            labelStyle: TextStyle(fontSize: 12),
            indicatorPadding: EdgeInsets.all(0),
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey[600],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
