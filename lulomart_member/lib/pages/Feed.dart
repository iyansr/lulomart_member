import 'package:flutter/material.dart';
import 'package:lulomart_member/ui/colors.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text(
          'Feed',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
        ),
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => Container(
            height: 180,
            margin: EdgeInsets.only(bottom: 12.0),
            padding: EdgeInsets.all(20.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  leading: Icon(
                    Icons.feedback,
                    color: Colors.green,
                    size: 35.0,
                  ),
                  title: Text('#Admin LuloMart',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: primaryColor)),
                  subtitle: Text('12 September 2019',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Awal Bulan nih, udah gajian kan? Yuk belanja kebutuhan bulanan mu di LuloMart, banyak promonya lho !!',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            )),
      ),
    );
  }
}
