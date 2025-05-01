import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AVFlexApp());
}

class AVFlexApp extends StatelessWidget {
  const AVFlexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AVFlex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}
