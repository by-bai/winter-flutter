import 'package:flutter/material.dart';
import 'fooderlich_theme.dart'; // import theme
import 'home.dart';

void main() {
  // 1
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  // 2
  const Fooderlich({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark(); // define variable that holds the theme
    return MaterialApp(
      theme: theme, // add theme property
      title: 'Fooderlich',
      home: const Home(),
    );
  }
}