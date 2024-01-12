import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.more_vert_rounded,
            size: 24.0,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.code_rounded,
              size: 24.0,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.favorite_outline,
              size: 24.0,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemBuilder: (context, index) => [
            const SizedBox(height: 32.0),
            Text(
              'MYRecipies',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ][index],
          itemCount: 2,
        ),
      ),
    );
  }
}
