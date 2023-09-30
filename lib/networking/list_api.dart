import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Users>> fetchUsers() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  if (response.statusCode == 200) {
    List<dynamic> _parsedListJson = jsonDecode(response.body);
    List<Users> _itemsList = List<Users>.from(
        _parsedListJson.map<Users>((dynamic i) => Users.fromJson(i)));
    return _itemsList;
  } else {
    throw Exception('Failed to load album');
  }
}

//Json Model Class
class Users {
  final int userId;
  final int id;
  final String title;

  const Users({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Users>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Users>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (contxt, i) {
                      var item = snapshot.data![i];

                      return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  Color(Random().nextInt(0xffffffff))
                                      .withAlpha(0xff),
                            ),
                            title: Text(item.title),
                          ));
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
