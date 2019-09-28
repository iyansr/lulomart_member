import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lulomart_member/models/product.dart';

final AsyncMemoizer<List<Product>> _memoizer = AsyncMemoizer();
Future<List<Product>> fetchProduct(http.Client client) {
  return _memoizer.runOnce(() async {
    final response = await client.get(
        'https://www.lulomart.com/inventory/index.php/api/productbycategory?productcategory_id=');
    try {
      final result = await InternetAddress.lookup('https://www.lulomart.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        // Use the compute function to run parsePhotos in a separate isolate
        return compute(parseData, response.body);
      }
    } on SocketException catch (_) {
      print('not connected');
    }
    // Use the compute function to run parsePhotos in a separate isolate
    return compute(parseData, response.body);
  });
}

// A function that will convert a response body into a List<Product>
List<Product> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  List<Product> list =
      parsed.map<Product>((json) => new Product.fromJson(json)).toList();
  return list;
}
