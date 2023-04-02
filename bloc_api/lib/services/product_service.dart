import 'dart:convert';

import 'package:http/http.dart';

import '../models/product_model.dart';

class ProductRepository {
  String endpoint = 'https://dummyjson.com/products?skip=5&limit=';

  Future<List<ProductModel>> fetchProduct(String limit) async {
    final String end = endpoint+limit;
    Response response = await get(Uri.parse(end));
    if (response.statusCode == 200) {
      final List product = jsonDecode(response.body)['products'];
      return product.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
