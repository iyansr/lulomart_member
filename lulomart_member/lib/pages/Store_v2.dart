import 'package:flutter/material.dart';
import 'package:lulomart_member/ui/colors.dart';
import 'package:lulomart_member/widgets/cateory_button.dart';
import 'package:lulomart_member/widgets/outlet_card.dart';
import 'package:lulomart_member/widgets/product_futureBuilder.dart';
import 'package:lulomart_member/widgets/rekomendasi_futureBuilder.dart';
import 'package:lulomart_member/widgets/store_appbar.dart';

class StoreV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();
    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: storeAppbar(context),
      body: ListView(
        controller: _controller,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          OutletCard(),
          futureRekomendasi(context),
          Column(
            children: <Widget>[
              CategoryBtn(),
            ],
          ),
          productFutureBuilder(context, _controller),
        ],
      ),
    );
  }
}
