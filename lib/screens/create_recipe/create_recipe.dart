// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:html_recipe_parser/html_recipe_parser.dart' as parser;
import 'package:myrecipes/models/recipe.dart';
import 'package:myrecipes/state/home/home_state.dart';
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

                FocusScope.of(context).unfocus();

                try {
                  final parsed =
                      await parser.RecipeParser().parseUrl(controller.text);

                  if (parsed == null) {
                    setState(() {
                      errorText = 'Failed to find recipe';
                    });
                  } else {
                    final recipe = await Recipe.fromParsed(parsed);
                    final provider = Provider.of<HomeState>(
                      context,
                      listen: false,
                    );

                    await provider.addRecipe(recipe);

                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          'Added recipe!',
                        ),
                      ),
                    );
                  }
                } on FormatException catch (e) {
                  setState(() {
                    errorText = e.message;
                  });
                } on Exception catch (e) {
                  context.pop();
                  showDialog(
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
                  if (mounted) {
                    setState(() {
                      loading = false;
                    });
                  }
                }
              },
              child: !loading
                  ? const Text(
                      'Save',
                    )
                  : const SizedBox(
                      height: 20.0,
                      width: 20.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 3.0,
                      ),
                    ),
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
                readOnly: loading,
                controller: controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text(
                    'Recipe link',
                  ),
                  errorText: errorText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
