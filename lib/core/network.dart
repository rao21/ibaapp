import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ibaapp/models/user_model.dart';

class UserApiClient {
  final http.Client httpClient;

  UserApiClient({required this.httpClient});

  Future<List<User>> fetchuser() async {
    final userResponse = await httpClient.get(Uri.parse(Endpoints.userUrl));

    if (userResponse.statusCode != 200) {
      throw Exception('error getting user for location');
    }
    List<dynamic> parsedListJson = jsonDecode(userResponse.body);

    List<User> itemsList = List<User>.from(
        parsedListJson.map<User>((dynamic i) => User.fromJson(i)));

    return itemsList;
  }

  Future<List<User>> fetchUserMoc() async {
    return [User(completed: true, id: 12, title: 'MOC OBJ', userId: 12)];
  }
}

class Endpoints {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String userUrl = '$baseUrl/todos';
}
