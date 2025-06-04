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

class FoodFilterScreen extends StatefulWidget {
  const FoodFilterScreen({super.key});

  @override
  State<FoodFilterScreen> createState() => _FoodFilterScreenState();
}

class _FoodFilterScreenState extends State<FoodFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Filter Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select your dietary preferences:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
