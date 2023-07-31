import 'package:flutter/material.dart';

import '../widgets/counter_button.dart';
import '../widgets/counter_display.dart';

class Exercicio13 extends StatefulWidget {
  const Exercicio13({Key? key}) : super(key: key);

  @override
  State<Exercicio13> createState() => _Exercicio13State();
}

class _Exercicio13State extends State<Exercicio13> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Crie uma tela com um contador e dois botões. Um botão (+) irá incrementar o contador; Um botão (-) irá decrementar o contador; Exiba o contador em tela;',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            CounterDisplay(counter: _counter),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterButton(
                  icon: Icons.remove_circle,
                  onPressed: _decrementCounter,
                ),
                SizedBox(width: 16),
                CounterButton(
                  icon: Icons.add_circle,
                  onPressed: _incrementCounter,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
