import 'package:flutter/material.dart';
import 'package:myrecipes/models/recipe.dart';
import 'package:myrecipes/widgets/ingredient_list_item.dart';

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
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 6.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return IngredientListItem(
              title: recipe.ingredients.elementAt(index).text,
            );
          },
          itemCount: recipe.ingredients.length,
        ),
      ),
    );
  }
}
