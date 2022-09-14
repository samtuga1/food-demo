import 'package:flutter/material.dart';
import 'package:food_demo/home_page.dart';
import 'package:food_demo/utilities/recipe_model.dart';
import 'package:food_demo/utilities/recipes.dart';
import 'package:food_demo/utilities/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RecipeModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => Recipes(),
        ),
      ],
      child: MaterialApp(
        theme: MyTheme.app_theme,
        title: 'Flutter Demo',
        home: const HomePage(),
      ),
    );
  }
}
