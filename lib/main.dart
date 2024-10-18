import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myrecipes/state/home/home_state.dart';
import 'package:myrecipes/state/recipe/recipe_state.dart';
import 'package:provider/provider.dart';

import 'package:myrecipes/enums/hive_boxes.dart';
import 'package:myrecipes/models/ingredient.dart';
import 'package:myrecipes/models/recipe.dart';
import 'package:myrecipes/models/recipe_image.dart';
import 'package:myrecipes/models/recipe_instruction.dart';
import 'package:myrecipes/screens/home/home.dart';
import 'package:myrecipes/screens/recipe/recipe.dart';
import 'package:myrecipes/theme/color_schemes.g.dart';
import 'package:myrecipes/state/preferences.s.dart';

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
  await Hive.openBox(HiveBox.preferences.name);

  final homeState = HomeState();
  final preferences = PreferencesState();
  homeState.loadRecipes();
  preferences.load();

  runApp(
    MYrecipes(
      homeState: homeState,
      preferences: preferences,
    ),
  );
}

class MYrecipes extends StatelessWidget {
  const MYrecipes({
    super.key,
    required this.homeState,
    required this.preferences,
  });

  final HomeState homeState;
  final PreferencesState preferences;

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

    return MultiProvider(
      providers: [
        Provider.value(value: homeState),
        Provider.value(value: preferences),
      ],
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
