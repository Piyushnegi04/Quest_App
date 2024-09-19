import 'package:flutter/material.dart';
import 'package:quest/screens/quest_interface.dart';

// main.dart
void main() {
  runApp(QuestApp());
}

class QuestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quest App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: CategoryListScreen(),
    );
  }
}
