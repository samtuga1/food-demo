import 'package:flutter/material.dart';
import 'package:food_demo/home_page.dart';
import 'package:food_demo/utilities/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.app_theme(),
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}
