import 'package:flutter/material.dart';
import 'package:my_recipes/models/recipe.m.dart';

class InstructionsCard extends StatefulWidget {
  const InstructionsCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  State<InstructionsCard> createState() => _InstructionsCardState();
}

class _InstructionsCardState extends State<InstructionsCard> {
  int step = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.tertiaryContainer,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Directions',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            Text(
              widget.recipe.instructions[step].text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (step > 0)
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        step--;
                      });
                    },
                    child: const Text('Back'),
                  )
                else
                  const SizedBox(),
                if (step < widget.recipe.instructions.length - 1)
                  FilledButton(
                    onPressed: () {
                      setState(() {
                        step++;
                      });
                    },
                    child: const Text('Next'),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
