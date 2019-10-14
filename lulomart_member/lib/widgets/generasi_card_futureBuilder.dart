import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lulomart_member/models/fetch_api.dart';
import 'package:http/http.dart' as http;
import 'package:lulomart_member/models/generasi1.dart';
import 'package:lulomart_member/models/generasi2.dart';
import 'package:lulomart_member/models/generasi3.dart';
import 'package:lulomart_member/pages/Generasi.dart';
import 'package:lulomart_member/ui/colors.dart';
import 'package:lulomart_member/widgets/generasiCard_card.dart';

class GenerasiCardFuture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FutureBuilder(
          future: fetchG1(http.Client(), 'mmbr20181116171343100001'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Generasi1> gen1;
              gen1 = snapshot.data;
              return GenerasiCardWidget(
                color: primaryColor,
                gen: 1,
                totalGen: gen1.length.toString(),
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => Generasi(
                        gen: '1',
                      ),
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
        FutureBuilder(
          future: fetchG2(http.Client(), 'mmbr20181116171343100001'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Generasi2> gen2;
              gen2 = snapshot.data;
              return GenerasiCardWidget(
                color: primaryColor,
                gen: 2,
                totalGen: gen2.length.toString(),
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => Generasi(
                        gen: '2',
                      ),
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
        FutureBuilder(
          future: fetchG3(http.Client(), 'mmbr20181116171343100001'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Generasi3> gen3;
              gen3 = snapshot.data;
              return GenerasiCardWidget(
                color: primaryColor,
                gen: 3,
                totalGen: gen3.length.toString(),
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => Generasi(
                        gen: '3',
                      ),
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}
