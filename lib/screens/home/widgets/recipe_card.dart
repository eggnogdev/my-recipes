import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recipes/models/recipe.m.dart';
import 'package:my_recipes/screens/home/state/home.s.dart';
import 'package:provider/provider.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
    this.margin,
  });

  final Recipe recipe;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width / 3.8;

    return Card(
      elevation: 0,
      margin: margin ??
          const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: 1.5,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
          context.go('/recipes/${recipe.uuid}');
        },
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                'Delete Recipe',
              ),
              content: Text(
                'Do you want to delete ${recipe.name}?',
              ),
              actions: [
                OutlinedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text(
                    'Cancel',
                  ),
                ),
                FilledButton(
                  onPressed: () async {
                    final provider = Provider.of<HomeState>(
                      context,
                      listen: false,
                    );
                    provider.deleteRecipe(recipe);
                    context.pop();
                  },
                  child: const Text(
                    'Delete',
                  ),
                ),
              ],
            ),
          );
        },
        child: SizedBox(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 16.0,
                    right: 8.0,
                    bottom: 16.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        recipe.description,
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: height,
                width: height,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                  image: DecorationImage(
                    image: FileImage(File(recipe.image.filePath)),
                    fit: BoxFit.cover,
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
