import 'package:flutter/material.dart';

class GenerasiCardWidget extends StatelessWidget {
  final Color color;
  final int gen;
  final String totalGen;
  final VoidCallback onTap;
  GenerasiCardWidget({
    this.color = Colors.blue,
    this.gen,
    this.totalGen,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            color: color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Text(
                    'Generasi $gen',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$totalGen',
                    style: TextStyle(color: Colors.white, fontSize: 46),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
