import 'package:flutter/material.dart';
import 'package:sl3v1_flutter/Screens/exercicio_09_pag_02.dart';

class Exercicio09 extends StatelessWidget {
  const Exercicio09({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercício 9"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Essa é a tela 1"),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Exercicio09Pag02(),
                  ));
                },
                child: Text("Ir para a tela 2"))
          ],
        ),
      ),
    );
  }
}
