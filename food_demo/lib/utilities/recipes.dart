import 'package:flutter/cupertino.dart';
import 'package:food_demo/utilities/recipe_model.dart';

class Recipes with ChangeNotifier {
  final List<RecipeModel> _recipes = [
    RecipeModel(
      title: 'Lemon Cheesecake',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      imageUrl: 'assets/images/01-lemon-cheesecake.png',
    ),
    RecipeModel(
      title: 'Lemon Cheesecake',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      imageUrl: 'assets/images/02-chocolate-cake-1.png',
    ),
    RecipeModel(
      title: 'Lemon Cheesecake',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      imageUrl: 'assets/images/05-macaroons.png',
    ),
    RecipeModel(
      title: 'Lemon Cheesecake',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      imageUrl: 'assets/images/06-white-cream-cake.png',
    ),
    RecipeModel(
      title: 'Lemon Cheesecake',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      imageUrl: 'assets/images/07-honey-cake.png',
    ),
    RecipeModel(
      title: 'Lemon Cheesecake',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      imageUrl: 'assets/images/08-cream-cupcakes.png',
    ),
    RecipeModel(
      title: 'Lemon Cheesecake',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      imageUrl: 'assets/images/09-fruit-plate.png',
    ),
    RecipeModel(
      title: 'Lemon Cheesecake',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      imageUrl: 'assets/images/10-strawberries.png',
    ),
    RecipeModel(
      title: 'Lemon Cheesecake',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      imageUrl: 'assets/images/11-powdered-cake.png',
    ),
    RecipeModel(
      title: 'Lemon Cheesecake',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      imageUrl: 'assets/images/12-chocolate-cake-2.png',
    ),
    RecipeModel(
      title: 'Lemon Cheesecake',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      imageUrl: 'assets/images/13-strawberry-powdered-cake.png',
    ),
    RecipeModel(
      title: 'Lemon Cheesecake',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      imageUrl: 'assets/images/14-fruit-pie.png',
    ),
    RecipeModel(
      title: 'Lemon Cheesecake',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
      imageUrl: 'assets/images/15-apple-pie.png',
    ),
  ];
  List<RecipeModel> get recipes => _recipes;
}
