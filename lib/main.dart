import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: Color(0xFF1B1B1B),
      ),
      home: const InputPage(),
    );
  }
}
