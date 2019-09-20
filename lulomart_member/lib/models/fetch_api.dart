import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lulomart_member/models/product.dart';

Future<List<Product>> fetchProduct(http.Client client) async {
  final response = await client.get(
      'https://www.lulomart.com/inventory/index.php/api/productbycategory?productcategory_id=');
  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseData, response.body);
}

// A function that will convert a response body into a List<Country>
List<Product> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  List<Product> list =
      parsed.map<Product>((json) => new Product.fromJson(json)).toList();
  return list;
}
