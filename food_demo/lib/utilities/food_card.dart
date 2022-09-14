import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_demo/screens/recipe_detail.dart';
import 'package:food_demo/utilities/food_item.dart';
import 'package:food_demo/utilities/recipe_model.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatefulWidget {
  const FoodCard(
      {Key? key, this.child, this.scrollDirection = ScrollDirection.forward})
      : super(key: key);
  final dynamic child;
  final ScrollDirection scrollDirection;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;
  late final Animation<double> perspectiveAnimation;
  late final Animation<AlignmentGeometry> alignmentAnimation;
  static const double perspectiveValue = 0.004;

  //````````````````````````
  String? title;
  String? subtitle;
  String? imageUrl;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final recipeAttr = Provider.of<RecipeModel>(context);
    title = recipeAttr.title;
    subtitle = recipeAttr.subtitle;
    imageUrl = recipeAttr.imageUrl;
  }

  @override
  void initState() {
    super.initState();
    final int perspectiveDirectionMultiplier =
        widget.scrollDirection == ScrollDirection.forward ? -1 : 1;

    final AlignmentGeometry directionAlignment =
        widget.scrollDirection == ScrollDirection.forward
            ? Alignment.bottomCenter
            : Alignment.topCenter;

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    scaleAnimation = Tween<double>(begin: 0.7, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.5, curve: Curves.easeOut),
      ),
    );

    perspectiveAnimation = Tween<double>(
      begin: perspectiveValue * perspectiveDirectionMultiplier,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 1, curve: Curves.easeOut),
      ),
    );

    alignmentAnimation = Tween<AlignmentGeometry>(
      begin: directionAlignment,
      end: Alignment.center,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 1, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: animationController,
      child: widget.child,
      builder: (context, child) => Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 1, perspectiveAnimation.value),
        alignment: alignmentAnimation.value,
        child: Transform.scale(
          scale: scaleAnimation.value,
          child: GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(RecipeDetail.routeName),
            child: FoodItem(
              theme: theme,
              title: title,
              subtitle: subtitle,
              imageUrl: imageUrl,
            ),
          ),
        ),
      ),
    );
  }

  @override
  // THIS WILL ANIMATE THIS WIDGET ONLY ONES
  bool get wantKeepAlive => false;
}
