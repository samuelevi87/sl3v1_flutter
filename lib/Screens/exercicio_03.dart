/** Crie uma tela com um contador e dois botões.
    - Um botão (+) irá incrementar o contador;
    - Um botão (-) irá decrementar o contador;
    - Exiba o contador em tela
 */

import 'package:flutter/material.dart';

class CounterHome extends StatefulWidget {
  const CounterHome({super.key});

  @override
  State<CounterHome> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Crie uma tela com um contador e dois botões. Um botão (+) irá incrementar o contador; Um botão (-) irá decrementar o contador; Exiba o contador em tela;',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.justify),
              ),
            ),
            const Text(
              'Seu contador está em:',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '$_counter',
              style: TextStyle(
                  color: (_counter > 0 ? Colors.green : Colors.red),
                  fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: <Widget>[
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: _decrementCounter,
                            child: const Icon(Icons.remove_circle)),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: _incrementCounter,
                            child: const Icon(Icons.add_circle)),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
