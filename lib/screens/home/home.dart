import 'package:flutter/material.dart';
import 'package:my_recipies/models/recipe.m.dart';
import 'package:my_recipies/screens/home/widgets/recipe_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.more_vert_rounded,
            size: 24.0,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.code_rounded,
              size: 24.0,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.favorite_outline,
              size: 24.0,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) => [
            Container(
              margin: const EdgeInsets.only(
                top: 32.0,
                bottom: 20.0,
              ),
              child: Text(
                'MYRecipies',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const RecipeCard(
              recipe: Recipe(
                title: 'Title',
                description:
                    'Lorem ipsum dolor sit amet cosectetur adipiscing elit sed do eiusmod tempor',
                ingredients: [],
              ),
            ),
          ][index],
          itemCount: 2,
        ),
      ),
    );
  }
}
