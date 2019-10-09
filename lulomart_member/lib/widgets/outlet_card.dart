import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lulomart_member/models/outlet_model.dart';
import 'package:lulomart_member/utils/styles.dart';

class OutletCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Styles _fontStyle = Styles();
    OutletModel _outlet = OutletModel();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Outlet',
                    style: _fontStyle.boldText(),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Lihat Semua',
                      style: _fontStyle.linkText(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            // width: 100,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              itemCount: _outlet.outlet.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                // height: 110,
                width: 110,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 0,
                    child: Stack(
                      children: <Widget>[
                        CachedNetworkImage(
                          errorWidget: (c, u, o) => Text('error'),
                          placeholder: (c, img) => Image.asset(
                            'images/loading.gif',
                            height: 110,
                            width: 110,
                          ),
                          imageUrl: _outlet.outlet[index]['image'],
                          height: 110.0,
                          width: 110.0,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Color.fromRGBO(255, 255, 255, 0.70),
                            height: 30,
                            child: Center(
                              child: Text(
                                _outlet.outlet[index]['name'],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
