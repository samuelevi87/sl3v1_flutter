import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sl3v1_flutter/AppControllers/dark_theme_config.dart';
import 'package:sl3v1_flutter/Screens/exercicio_01.dart';
import 'package:sl3v1_flutter/Screens/main_home.dart';
import 'package:sl3v1_flutter/providers/product_provider.dart';

import 'Screens/exercicio_10.dart';
import 'providers/auth_provider.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: AnimatedBuilder(
        animation: DarkThemeConfig.instance,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SL3V1 App',
            theme: ThemeData(
              brightness: DarkThemeConfig.instance.isDarkTheme
                  ? Brightness.dark
                  : Brightness.light,
              primarySwatch: Colors.blueGrey,
            ),
            initialRoute: "/mainHome",
            routes: {
              "/mainHome": (context) =>
                  MainHome(title: 'Aprendendo Flutter +Devs2Blu'),
              "/exercicio01": (context) => Exercicio01(),
              "/1": (context) => BookPage(pageNumber: 1),
              "/2": (context) => BookPage(pageNumber: 2),
              "/3": (context) => BookPage(pageNumber: 3, lastPage: true),
            },
          );
        },
      ),
    );
  }
}
