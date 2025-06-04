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
      debugShowCheckedModeBanner: false,
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
  // List of available dietary filters
  final List<String> _allFilters = [
    'Vegetarian',
    'Vegan',
    'Gluten-Free',
    'Dairy-Free',
    'Nut-Free',
    'Keto',
    'Paleo'
  ];

  // Currently selected filters
  final List<String> _selectedFilters = [];

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
            // Section title
            const Text(
              'Select your dietary preferences:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            // Wrap widget demonstration
            Wrap(
              spacing: 8.0, // Horizontal space between chips
              runSpacing: 8.0, // Vertical space between lines
              alignment: WrapAlignment.start, // Alignment of chips
              children: _allFilters.map((filter) {
                return FilterChip(
                  label: Text(filter), // Text displayed in the chip
                  selected: _selectedFilters.contains(filter),
                  selectedColor: Colors.green[100], // Background color when selected
                  backgroundColor: Colors.grey[200], // Default background color
                  onSelected: (isSelected) {
                    setState(() {
                      if (isSelected) {
                        _selectedFilters.add(filter);
                      } else {
                        _selectedFilters.remove(filter);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            
            const SizedBox(height: 30),
            
            // Section title
            const Text(
              'Your selected filters:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            // Chip widget with delete demonstration
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _selectedFilters.map((filter) {
                return Chip(
                  label: Text(filter), // Text displayed in the chip
                  backgroundColor: Colors.green[100], // Background color
                  deleteIcon: const Icon(Icons.close, size: 18), // Delete icon
                  onDeleted: () { // Callback when delete is pressed
                    setState(() {
                      _selectedFilters.remove(filter);
                    });
                  },
                );
              }).toList(),
            ),
            
            const SizedBox(height: 30),
            
            // Display filtered results
            Expanded(
              child: ListView(
                children: _getFilteredFoodItems().map((item) => ListTile(
                  title: Text(item['name']!),
                  subtitle: Text(item['description']!),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Mock data filtering based on selected filters
  List<Map<String, String>> _getFilteredFoodItems() {
    final allItems = [
      {
        'name': 'Vegetable Stir Fry',
        'description': 'Fresh vegetables with tofu',
        'tags': 'Vegetarian,Vegan'
      },
      {
        'name': 'Grilled Chicken Salad',
        'description': 'Mixed greens with grilled chicken',
        'tags': 'Keto,Paleo'
      },
      {
        'name': 'Gluten-Free Pasta',
        'description': 'Pasta made from rice flour',
        'tags': 'Vegetarian,Gluten-Free'
      },
      {
        'name': 'Almond Milk Smoothie',
        'description': 'Berry smoothie with almond milk',
        'tags': 'Vegetarian,Vegan,Dairy-Free'
      },
    ];

    if (_selectedFilters.isEmpty) return allItems;

    return allItems.where((item) {
      final tags = item['tags']!.split(',');
      return _selectedFilters.any((filter) => tags.contains(filter));
    }).toList();
  }
}