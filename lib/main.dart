import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ibaapp/crud/list.dart';
import 'package:ibaapp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
          accentColor: Colors.pink,
        ),
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          displayLarge: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          displayMedium: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.grey[800]),
        ),
      ),
      home: const Friends(),
    );
  }
}

class AppColors {
  static const primaryColor = Color(0xFF6200EA); // Purple
  static const accentColor = Color(0xFFFFD600); // Yellow
  static const backgroundColor = Color(0xFFFFFFFF); // White
  static const textColor = Color(0xFF333333); // Dark gray
  static const secondaryColor = Color(0xFF03A9F4); // Blue
}
