import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:my_recipes/screens/recipe/state/recipe.s.dart';
import 'package:my_recipes/screens/recipe/widgets/instructions_card.dart';
import 'package:my_recipes/screens/recipe/widgets/ingredients_card.dart';
import 'package:my_recipes/state/preferences.s.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({
    super.key,
    required this.state,
  });

  final RecipeState state;

  @override
  Widget build(BuildContext context) {
    final prefs = Provider.of<PreferencesState>(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        WakelockPlus.disable();
        Navigator.of(context).pop();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            state.recipe.name,
          ),
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.keyboard_arrow_left_rounded,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          actions: [
            Tooltip(
              message: 'Keep screen awake',
              child: Observer(builder: (context) {
                return Radio(
                  value: true,
                  groupValue: prefs.recipeKeepAwake,
                  toggleable: true,
                  onChanged: (value) {
                    prefs.recipeKeepAwake = value ?? false;

                    if (prefs.recipeKeepAwake) {
                      WakelockPlus.enable();
                    } else {
                      WakelockPlus.disable();
                    }
                  },
                );
              }),
            ),
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
      ),
    );
  }
}
