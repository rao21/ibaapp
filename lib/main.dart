import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ibaapp/core/network.dart';
import 'package:ibaapp/core/repository/user_repo.dart';
import 'package:ibaapp/page/user_page.dart';

void main() {
  final UserRepository userRepository = UserRepository(
    userApiClient: UserApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(MyApp(
    userRepository: userRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.userRepository});
  final UserRepository userRepository;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
          useMaterial3: true,
        ),
        home: UserPage(
          userRepository: userRepository,
        ));
  }
}
