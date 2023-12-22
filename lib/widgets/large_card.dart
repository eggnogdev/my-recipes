import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recipies/models/recipe.m.dart';

class LargeRecipeCard extends StatelessWidget {
  const LargeRecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 6.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
          context.go('/recipies/0');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150.0,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Center(
                child: Text('Recipe Image'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  if (recipe.description != null)
                    Text(
                      recipe.description!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
