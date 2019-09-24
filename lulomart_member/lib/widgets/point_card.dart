import 'package:flutter/material.dart';

class PointCard extends StatelessWidget {
  final Color color;
  final Color textColor;

  PointCard({this.color, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  'Status Point',
                  style: TextStyle(color: textColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '3.191',
                  style: TextStyle(color: textColor, fontSize: 46),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
