import 'package:ecommerce_app_flutter/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: prefer_const_constructors
      title: "Mero Cart",
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}