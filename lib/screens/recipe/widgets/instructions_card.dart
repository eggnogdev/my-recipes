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
      elevation: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 6.0,
        ),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Instructions',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              subtitle: Text(
                '${step + 1} of ${widget.recipe.instructions.length}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
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
