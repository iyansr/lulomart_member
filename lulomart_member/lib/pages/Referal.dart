import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyReferal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black87,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            size: 20,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.plus,
              size: 18.0,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
        ],
        title: Text(
          'Referal Saya',
          style: TextStyle(color: Colors.black87),
        ),
        bottom: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1,
          backgroundColor: Colors.white,
          title: Container(
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                icon: Icon(FontAwesomeIcons.search, size: 18),
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
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
