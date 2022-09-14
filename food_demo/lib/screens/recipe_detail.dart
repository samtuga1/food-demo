import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../utilities/ingredient_item.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RecipeDetail extends StatefulWidget {
  static const routeName = '/detail';
  const RecipeDetail({Key? key}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  ScrollController scrollController = ScrollController();
  double angle = 2.0;

  void rotateRecipe() {
    setState(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        angle += scrollController.offset / 1000;
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        angle -= scrollController.offset / 1000;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(rotateRecipe);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(rotateRecipe);
  }

  @override
  Widget build(BuildContext context) {
    final image = ModalRoute.of(context)?.settings.arguments as String;
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        slivers: [
          SliverAppBar(
            stretch: true,
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
            expandedHeight: 320,
            flexibleSpace: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    color: Colors.yellow,
                  ),
                  child: FlexibleSpaceBar(
                    stretchModes: const [StretchMode.zoomBackground],
                    background: Image.asset(
                      'assets/images/bg-food.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: angle * pi,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Hero(
                          tag: image,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset.zero,
                                  blurRadius: 7.5,
                                ),
                              ],
                            ),
                            height: 230,
                            width: 230,
                            child: Image.asset(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
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
                      ...List.generate(
                        10,
                        (i) => IngredientItem(theme: theme)
                            .animate()
                            .fadeIn(
                                //delay: Duration(milliseconds: 50 * i),
                                duration: Duration(milliseconds: 100 * i))
                            .slide(
                              delay: Duration(milliseconds: 100 * i),
                              duration: const Duration(milliseconds: 400),
                              begin: const Offset(0, 0.5),
                              end: Offset.zero,
                            ),
                      ).toList(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
