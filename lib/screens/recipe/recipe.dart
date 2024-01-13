import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recipies/screens/recipe/state/recipe.s.dart';
import 'package:my_recipies/widgets/ingredient_list_item.dart';

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
        title: Text(
          state.recipe.title,
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
            splashRadius: 20.0,
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_rounded,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 6.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: Theme.of(context).colorScheme.surface,
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ingredients',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.outline,
                          thickness: 1.0,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              IngredientListItem(title: '2 eggs'),
                              IngredientListItem(title: '1/2 cup flour'),
                              IngredientListItem(title: '3/4 cup sugar'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 24.0),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                color: Theme.of(context).colorScheme.surface,
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Directions',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.outline,
                          thickness: 1.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
