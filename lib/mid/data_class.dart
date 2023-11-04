import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'package:ibaapp/mid/product_model.dart';

//
class ProviderClass extends ChangeNotifier {
  List<Products>? post;
  bool loading = false;

  getDataFromAPI() async {
    loading = true;

    post = (await callAPI());
    loading = false;
    notifyListeners();
  }

  Future<List<Products>> callAPI() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        Map<String, dynamic> parsedListJson = jsonDecode(response.body);
        List<Products> itemsList = List<Products>.from(
            parsedListJson["products"]
                .map<Products>((dynamic i) => Products.fromJson(i)));
        return itemsList;
      } else {
        throw Exception('Failed to load album');
      }
    } catch (exp) {
      throw Exception(exp.toString());
    }
  }
}
