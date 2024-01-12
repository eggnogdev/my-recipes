import 'package:flutter/material.dart';
import 'package:my_recipies/models/recipe.m.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
    this.margin,
  });

  final Recipe recipe;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width / 4;

    return Card(
      elevation: 0,
      margin: margin ??
          const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: 1.5,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {},
        child: SizedBox(
          height: height,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 16.0,
                    right: 8.0,
                    bottom: 16.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        recipe.description,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: height,
                height: height,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/cake.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
