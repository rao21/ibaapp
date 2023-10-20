import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'product_model.dart';

Future<List<Products>> fetchStocks() async {
  try {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      Map<String, dynamic> parsedListJson = jsonDecode(response.body);
      List<Products> itemsList = List<Products>.from(parsedListJson["products"]
          .map<Products>((dynamic i) => Products.fromJson(i)));
      return itemsList;
    } else {
      throw Exception('Failed to load album');
    }
  } catch (exp) {
    throw Exception(exp.toString());
  }
}

//Json Model Class

class StockList extends StatefulWidget {
  const StockList({super.key});

  @override
  State<StockList> createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Products>>(
          future: fetchStocks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (contxt, i) {
                    var item = snapshot.data![i];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ProductCard(
                        obj: item,
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return Center(child: const CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Products obj;

  const ProductCard({super.key, required this.obj});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (obj.thumbnail!.isNotEmpty)
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: Image.network(
                obj.thumbnail!,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _getTitle(obj.title),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${obj.price.toString()} USD",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                            onPressed: () => showModalBottomSheet(
                                builder: (context) {
                                  return ProductDetailBottomSheet(obj: obj);
                                },
                                context: context),
                            icon: const Icon(
                              Icons.remove_red_eye_sharp,
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  obj.description ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    //color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getTitle(String? title) {
    if (title!.length < 20) {
      return title;
    }
    return title.substring(0, title.length - 15);
  }
}

class ProductDetailBottomSheet extends StatelessWidget {
  final Products obj;

  ProductDetailBottomSheet({
    required this.obj,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: obj.images.map((image) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Image.network(image,
                          width: 150, height: 150, fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  obj.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  obj.description ?? '',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  '\$${obj.price?.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.yellow),
                    Text(
                      obj.rating.toStringAsFixed(1),
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          obj.discountPercentage.toString() + '%',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.discount, color: Colors.cyan),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
