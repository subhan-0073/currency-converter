import 'package:currency_converter/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Currency Converter ",
        home: HomeScreenn(),
        debugShowCheckedModeBanner: false);
  }
}
