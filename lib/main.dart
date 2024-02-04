import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_recipes/models/hive_boxes.dart';
import 'package:my_recipes/models/ingredient.m.dart';
import 'package:my_recipes/models/recipe.m.dart';
import 'package:my_recipes/models/recipe_image.m.dart';
import 'package:my_recipes/models/recipe_instruction.m.dart';
import 'package:my_recipes/screens/home/home.dart';
import 'package:my_recipes/screens/home/state/home.s.dart';
import 'package:my_recipes/screens/recipe/recipe.dart';
import 'package:my_recipes/screens/recipe/state/recipe.s.dart';
import 'package:my_recipes/theme/color_schemes.g.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  await Hive.initFlutter();
  Hive
    ..registerAdapter(RecipeAdapter())
    ..registerAdapter(IngredientAdapter())
    ..registerAdapter(RecipeInstructionAdapter())
    ..registerAdapter(RecipeImageAdapter());

  await Hive.openBox<Recipe>(HiveBox.recipes.name);

  runApp(const MYrecipes());
}

class MYrecipes extends StatelessWidget {
  const MYrecipes({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
          routes: [
            GoRoute(
              path: 'recipes/:uuid',
              builder: (context, state) => RecipeScreen(
                state: RecipeState(
                  uuid: state.pathParameters['uuid']!,
                ),
              ),
            )
          ],
        ),
      ],
    );

    return Provider(
      create: (context) => HomeState()..loadRecipes(),
      child: MaterialApp.router(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          typography: Typography.material2021(
            colorScheme: lightColorScheme,
          ),
          appBarTheme: const AppBarTheme(
            scrolledUnderElevation: 0,
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          typography: Typography.material2021(
            colorScheme: darkColorScheme,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
