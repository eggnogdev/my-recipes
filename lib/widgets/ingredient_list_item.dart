import 'package:flutter/material.dart';
import 'package:myrecipes/widgets/checkbox.dart';

class IngredientListItem extends StatelessWidget {
  const IngredientListItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const ManagedCheckbox(),
      title: Text(
        title,
      ),
    );
  }
}
