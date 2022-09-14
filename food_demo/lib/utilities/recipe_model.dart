import 'package:flutter/cupertino.dart';

class RecipeModel with ChangeNotifier {
  String? title;
  String? subtitle;
  String? imageUrl;

  RecipeModel({
    this.title,
    this.subtitle,
    this.imageUrl,
  });
}
