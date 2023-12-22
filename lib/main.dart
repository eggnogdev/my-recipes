import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_recipies/screens/home.dart';
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
    return MaterialApp(
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
      home: const Material(
        child: HomeScreen(),
      ),
    );
  }
}
