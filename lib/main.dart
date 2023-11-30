import 'package:flutter/material.dart';
import 'package:ibaapp/Widgets/list_tile.dart';
import 'package:ibaapp/Widgets/list_view.dart';

import 'Widgets/buttons.dart';
import 'Widgets/cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: true,
      ),
      home: const FLutterList(),
    );
  }
}

