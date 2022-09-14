import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    Key? key,
    required this.theme,
    this.title,
    this.subtitle,
    this.imageUrl,
  }) : super(key: key);

  final ThemeData theme;
  final String? title;
  final String? subtitle;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.yellow,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 9),
                    blurRadius: 9.5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 200,
                      child: Text(
                        title!,
                        style: theme.textTheme.titleLarge,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 185,
                      child: Text(
                        subtitle!,
                        style: theme.textTheme.bodyMedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: -2,
            bottom: -15,
            child: Hero(
              tag: imageUrl!,
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  imageUrl!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
