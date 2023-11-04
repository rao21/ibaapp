import 'package:flutter/material.dart';
import 'package:ibaapp/mid/data_class.dart';
import 'package:ibaapp/mid/mid.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProviderClass(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
            useMaterial3: true,
          ),
          home: const StockList(),
        ));
  }
}
