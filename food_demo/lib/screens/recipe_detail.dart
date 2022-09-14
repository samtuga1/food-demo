import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' show pi;
import '../utilities/ingredient_item.dart';

class RecipeDetail extends StatefulWidget {
  static const routeName = '/detail';
  const RecipeDetail({Key? key}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  ScrollController scrollController = ScrollController();
  ValueNotifier<ScrollDirection> scrollDirection =
      ValueNotifier<ScrollDirection>(ScrollDirection.forward);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            scrollDirection.value = ScrollDirection.forward;
          }
          if (notification.direction == ScrollDirection.reverse) {
            scrollDirection.value = ScrollDirection.reverse;
          }
          return true;
        },
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              collapsedHeight: 200,
              pinned: true,
              leadingWidth: 46,
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              expandedHeight: 340,
              flexibleSpace: Stack(
                children: [
                  Container(
                    height: 340,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg-food.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      color: Colors.yellow,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: ValueListenableBuilder<ScrollDirection>(
                          valueListenable: scrollDirection,
                          builder: (context, scrollDirection, child) {
                            int angle = 2;
                            while (scrollDirection == ScrollDirection.forward) {
                              angle += 1;
                              print(angle);
                            }
                            return Transform.rotate(
                              angle: pi * 2,
                              child: SizedBox(
                                height: 230,
                                width: 230,
                                child: Image.asset(
                                  'assets/images/15-apple-pie.png',
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lemon Cheesecake',
                          style: theme.textTheme.titleLarge,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                          style: theme.textTheme.bodyMedium,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Ingredients',
                          style: theme.textTheme.titleLarge,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        IngredientItem(theme: theme),
                        IngredientItem(theme: theme),
                        IngredientItem(theme: theme),
                        IngredientItem(theme: theme),
                        IngredientItem(theme: theme),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
