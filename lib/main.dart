import 'package:flutter/material.dart';
import 'package:my_recipies/theme/color_schemes.g.dart';

void main() {
  runApp(const MYrecipies());
}

class MYrecipies extends StatelessWidget {
  const MYrecipies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
    );
  }
}
