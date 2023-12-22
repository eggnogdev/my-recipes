import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recipies/screens/home.dart';
import 'package:my_recipies/screens/recipe.dart';
import 'package:my_recipies/theme/color_schemes.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(const MYrecipies());
}

class MYrecipies extends StatelessWidget {
  const MYrecipies({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'recipies/:id',
              builder: (context, state) => const RecipeScreen(),
            )
          ],
        ),
      ],
    );

    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: lightColorScheme,
        typography: Typography.material2021(
          colorScheme: lightColorScheme,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        typography: Typography.material2021(
          colorScheme: darkColorScheme,
        ),
      ),
      routerConfig: router,
    );
  }
}
