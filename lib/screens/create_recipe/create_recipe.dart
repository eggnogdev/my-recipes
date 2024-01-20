// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:html_recipe_parser/html_recipe_parser.dart' as parser;
import 'package:my_recipes/models/hive_boxes.dart';
import 'package:my_recipes/models/recipe.m.dart';
import 'package:my_recipes/state/home.s.dart';
import 'package:provider/provider.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({
    super.key,
  });

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final TextEditingController controller = TextEditingController();
  bool loading = false;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Create Recipe',
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.close_rounded,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          actions: [
            TextButton(
              onPressed: () async {
                setState(() {
                  errorText = null;
                  loading = true;
                });

                try {
                  final parsed =
                      await parser.RecipeParser().parseUrl(controller.text);
                  if (parsed == null) {
                    setState(() {
                      errorText = 'Failed to find recipe';
                    });
                  } else {
                    final box = Hive.box<Recipe>(HiveBox.recipes.name);
                    final recipe = Recipe.fromParsed(parsed);
                    await box.put(recipe.uuid, recipe);
                    final provider = Provider.of<HomeState>(
                      context,
                      listen: false,
                    );
                    provider.loadRecipes();
                  }
                } on FormatException catch (e) {
                  setState(() {
                    errorText = e.message;
                  });
                } on Exception catch (e) {
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Unhandled Exception',
                      ),
                      content: Text('$e'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text(
                            'Done',
                          ),
                        ),
                      ],
                    ),
                  );
                } finally {
                  setState(() {
                    loading = false;
                  });
                }
              },
              child: !loading
                  ? const Text(
                      'Save',
                    )
                  : const CircularProgressIndicator(),
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          padding: const EdgeInsets.only(
            top: 16.0,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Recipe link',
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
