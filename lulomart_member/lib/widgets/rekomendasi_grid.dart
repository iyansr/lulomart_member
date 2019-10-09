import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lulomart_member/models/rekomendasi.dart';
import 'package:lulomart_member/ui/colors.dart';

class RekomendasiGrid extends StatelessWidget {
  final List<Rekomendasi> rekomendasi;

  RekomendasiGrid({Key key, this.rekomendasi}) : super(key: key);

  Container getStructuredGridCell(Rekomendasi rekomendasi) {
    return Container(
      color: scaffoldBg,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        child: CachedNetworkImage(
          placeholder: (c, img) => Image.asset(
            'images/loading.gif',
            fit: BoxFit.cover,
          ),
          imageUrl: 'https://www.lulomart.com/inventory/upload/product/' +
              rekomendasi.picture,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      primary: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(6, (index) {
        return getStructuredGridCell(rekomendasi[index]);
      }),
    );
  }
}
