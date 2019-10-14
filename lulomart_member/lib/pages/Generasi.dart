import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lulomart_member/ui/colors.dart';

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
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (c, i) => Divider(),
          itemBuilder: (context, i) => Container(
            child: ListTile(
              title: Text('KM. DARMIASI'),
              subtitle: Text('2018-10-16 19:12:23'),
              trailing: SizedBox(
                height: 20.0,
                width: 20.0,
                child: IconButton(
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(Icons.more_vert, size: 18.0),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          shrinkWrap: true,
        ),
      ),
    );
  }
}
