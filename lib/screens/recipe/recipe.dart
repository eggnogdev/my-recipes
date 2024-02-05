import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recipes/screens/recipe/state/recipe.s.dart';
import 'package:my_recipes/screens/recipe/widgets/instructions_card.dart';
import 'package:my_recipes/screens/recipe/widgets/ingredients_card.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({
    super.key,
    required this.state,
  });

  final RecipeState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          state.recipe.name,
        ),
        leading: IconButton(
          splashRadius: 20.0,
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.keyboard_arrow_left_rounded,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            onPressed: null,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: IngredientsCard(
                recipe: state.recipe,
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: InstructionsCard(
                recipe: state.recipe,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
