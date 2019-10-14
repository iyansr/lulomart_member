import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:lulomart_member/models/generasi1.dart';
import 'package:lulomart_member/models/generasi2.dart';
import 'package:lulomart_member/models/generasi3.dart';
import 'package:lulomart_member/models/kategory.dart';
import 'package:lulomart_member/models/product.dart';
import 'package:lulomart_member/models/rekomendasi.dart';

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

final AsyncMemoizer<List<Rekomendasi>> _rekomenMemoizer = AsyncMemoizer();
Future<List<Rekomendasi>> fetchRekomen(http.Client client) {
  return _rekomenMemoizer.runOnce(() async {
    final response = await client.get(
        'https://www.lulomart.com/inventory/index.php/api/productbycategory?productcategory_id=');

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Rekomendasi> list = parsed
          .map<Rekomendasi>((json) => new Rekomendasi.fromJson(json))
          .toList();
      return list;
    } else {
      Exception('Failed');
    }
  });
}

final AsyncMemoizer<List<Kategori>> _memoizerCtg = AsyncMemoizer();
Future<List<Kategori>> fetchKategori(http.Client client) {
  return _memoizerCtg.runOnce(() async {
    final urlCategory = await client.get(
        'https://www.lulomart.com/inventory/index.php/api/productcategory');

    if (urlCategory.statusCode == 200) {
      final parsed = json.decode(urlCategory.body).cast<Map<String, dynamic>>();
      List<Kategori> list =
          parsed.map<Kategori>((json) => new Kategori.fromJson(json)).toList();
      return list;
    } else {
      Exception('Failed');
    }
  });
}

Future<List<Generasi1>> fetchG1(http.Client client, String memberId) async {
  final response = await client.get(
      'https://www.lulomart.com/inventory/index.php/api/member/generation?member_id=$memberId');

  if (response.statusCode == 200) {
    final parsed = (json.decode(response.body) as Map<String, dynamic>)['g1'];
    List<Generasi1> list =
        parsed.map<Generasi1>((json) => new Generasi1.fromJson(json)).toList();
    return list;
  } else {
    Exception('Failed');
  }
}

Future<List<Generasi2>> fetchG2(http.Client client, String memberId) async {
  final response = await client.get(
      'https://www.lulomart.com/inventory/index.php/api/member/generation?member_id=$memberId');

  if (response.statusCode == 200) {
    final parsed = (json.decode(response.body) as Map<String, dynamic>)['g2'];
    List<Generasi2> list =
        parsed.map<Generasi2>((json) => new Generasi2.fromJson(json)).toList();
    return list;
  } else {
    Exception('Failed');
  }
}

Future<List<Generasi3>> fetchG3(http.Client client, String memberId) async {
  final response = await client.get(
      'https://www.lulomart.com/inventory/index.php/api/member/generation?member_id=$memberId');

  if (response.statusCode == 200) {
    final parsed = (json.decode(response.body) as Map<String, dynamic>)['g3'];
    List<Generasi3> list =
        parsed.map<Generasi3>((json) => new Generasi3.fromJson(json)).toList();
    return list;
  } else {
    Exception('Failed');
  }
}
