import 'package:flutter/material.dart';
import 'package:my_recipies/models/recipe.m.dart';
import 'package:my_recipies/widgets/large_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 6.0,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        child: Icon(
          Icons.add_rounded,
          size: 24.0,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Text(
              'MYRecipies',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            leading: IconButton(
              splashRadius: 20.0,
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_rounded,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            actions: [
              IconButton(
                splashRadius: 20.0,
                onPressed: () {},
                icon: Icon(
                  Icons.code_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              IconButton(
                splashRadius: 20.0,
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_outline,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              )
            ],
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                LargeRecipeCard(
                  recipe: Recipe(
                    title: 'Recipe Title',
                    description:
                        'some description abouth this recipe, it is very nice and tasty',
                    ingredients: [
                      '2 eggs',
                      '1/2 cup flour',
                      '3/4 cup sugar',
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
