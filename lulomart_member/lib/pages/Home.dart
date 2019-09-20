import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/pages/Store.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Store(),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 55,
          child: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Home',
                icon: Icon(
                  FontAwesomeIcons.solidCompass,
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
                text: 'Home',
                icon: Icon(
                  FontAwesomeIcons.ship,
                  size: 18,
                ),
              ),
              Tab(
                text: 'Home',
                icon: Icon(
                  FontAwesomeIcons.user,
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
