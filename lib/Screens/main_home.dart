import 'package:flutter/material.dart';
import 'package:sl3v1_flutter/AppControllers/dark_theme_config.dart';
import 'package:sl3v1_flutter/Screens/counter_home.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  bool isDarkTheme = false;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            const CustomSwitch(),
          ],
        ),
        body: Column(
          children: [
            Text('Contador: $counter'),
            const CustomSwitch(),
          ],
        ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_circle,
            semanticLabel: 'Incrementar Contador',
            size: 55.0,
          ),
          onPressed: (){
            setState(() {
              counter++;
            });
          }),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: DarkThemeConfig.instance.isDarkTheme,
        onChanged: (value) {
          DarkThemeConfig.instance.changeTheme();
        });
  }
}
