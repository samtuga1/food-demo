import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 57,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.yellow.withOpacity(0.35),
                  width: 3.59,
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'eiusmod tempor incididunt',
                style: theme.textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Positioned(
              top: -1.8,
              left: -8,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.yellow,
                child: Icon(Icons.emoji_food_beverage_rounded),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
