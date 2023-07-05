import 'package:flutter/material.dart';
import 'package:sl3v1_flutter/AppControllers/dark_theme_config.dart';
import 'package:sl3v1_flutter/Screens/main_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Componente raiz da aplicação.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: DarkThemeConfig.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'SL3V1 App',
          theme: ThemeData(
            brightness: DarkThemeConfig.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
            primarySwatch: Colors.blueGrey,
          ),
          home: const MainHome(title: 'Aprendendo Flutter +Devs2Blu'),
        );
      },
    );
  }
}