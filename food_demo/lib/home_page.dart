import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_demo/utilities/food_card.dart';
import 'package:food_demo/utilities/recipes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<ScrollDirection> scrollDirectionNotifier =
      ValueNotifier<ScrollDirection>(ScrollDirection.forward);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dessert Recipes'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 3),
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward ||
                notification.direction == ScrollDirection.reverse) {
              scrollDirectionNotifier.value = notification.direction;
            }
            return true;
          },
          child: Consumer<Recipes>(
            builder: (context, recipes, child) => ListView.separated(
              itemBuilder: (context, index) {
                return ValueListenableBuilder(
                  valueListenable: scrollDirectionNotifier,
                  builder: (context, ScrollDirection scrollDirection, child) {
                    return ChangeNotifierProvider.value(
                      value: recipes.recipes[index],
                      child: FoodCard(
                        scrollDirection: scrollDirection,
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, i) => const SizedBox(height: 15),
              itemCount: recipes.recipes.length,
            ),
          ),
        ),
      ),
    );
  }
}
