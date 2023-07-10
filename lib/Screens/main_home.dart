import 'package:flutter/material.dart';
import 'package:sl3v1_flutter/AppControllers/dark_theme_config.dart';
import 'package:sl3v1_flutter/Screens/exercicio_01.dart';
import 'package:sl3v1_flutter/Screens/exercicio_02.dart';
import 'package:sl3v1_flutter/Screens/exercicio_03.dart';
import 'package:sl3v1_flutter/Screens/exercicio_04.dart';
import 'package:sl3v1_flutter/Screens/exercicio_05.dart';
import 'package:sl3v1_flutter/Screens/calculadora_gridview.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  bool isDarkTheme = false;
  int counter = 0;
  double stdHeight = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: const [
            CustomSwitch(),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: FilledButton.tonal(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Exercicio01();
                      },
                    ),
                  );
                }, child: Text('Exercicio 01')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child:FilledButton.tonal(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Exercicio02();
                      },
                    ),
                  );
                }, child: Text('Exercicio 02')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: FilledButton.tonal(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CounterHome();
                      },
                    ),
                  );
                },child: Text('Exercicio 03')),
              ),
                   Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: FilledButton.tonal(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Exercicio04();
                      },
                    ),
                  );
                },child: Text('Exercicio 04')),
              ),
               Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: FilledButton.tonal(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Exercicio05();
                      },
                    ),
                  );
                },child: Text('Exercicio 05')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: FilledButton.tonal(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Calculadora_Gridview();
                      },
                    ),
                  );
                },child: Text('Calculadora Gridview')),
              ),
            ],
          ),
        ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: DarkThemeConfig.instance.isDarkTheme,
        onChanged: (value) {
          setState(() {
          DarkThemeConfig.instance.changeTheme();
          });
        });
  }
}
