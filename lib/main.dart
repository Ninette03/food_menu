import 'package:flutter/material.dart';

void main() {
  runApp(const FoodFilterApp());
}

class FoodFilterApp extends StatelessWidget {
  const FoodFilterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Filter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FoodFilterScreen(),
    );
  }
}
