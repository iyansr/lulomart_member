import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:lulomart_member/models/product.dart';

final AsyncMemoizer<List<Product>> _memoizer = AsyncMemoizer();
Future<List<Product>> fetchProduct(http.Client client) {
  return _memoizer.runOnce(() async {
    final response = await client.get(
        'https://www.lulomart.com/inventory/index.php/api/productbycategory?productcategory_id=');

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Product> list =
          parsed.map<Product>((json) => new Product.fromJson(json)).toList();
      return list;
    } else {
      Exception('Failed');
    }
  });
}
