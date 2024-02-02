import 'package:flutter/material.dart';
import 'package:flutterweb/home.dart';
import 'package:flutterweb/screens/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: ResultPage());
  }
}
