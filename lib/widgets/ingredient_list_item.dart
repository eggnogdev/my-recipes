import 'package:flutter/material.dart';

class IngredientListItem extends StatelessWidget {
  const IngredientListItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.surface,
      title: const Text(
        'Flour',
      ),
      subtitle: const Text('450g'),
      leading: Icon(
        Icons.circle,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}
