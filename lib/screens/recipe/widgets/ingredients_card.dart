import 'package:flutter/material.dart';
import 'package:my_recipes/models/recipe.m.dart';
import 'package:my_recipes/widgets/ingredient_list_item.dart';

class IngredientsCard extends StatelessWidget {
  const IngredientsCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Theme.of(context).colorScheme.surface,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return IngredientListItem(
            title: recipe.ingredients.elementAt(index).text,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: recipe.ingredients.length,
      ),
    );
  }
}
