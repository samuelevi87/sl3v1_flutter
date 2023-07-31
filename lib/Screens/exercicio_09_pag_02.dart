import 'package:flutter/material.dart';

class Exercicio09Pag02 extends StatelessWidget {
  const Exercicio09Pag02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ex 9: Página 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Clique aqui para voltar para a página 1"),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Voltar"))
          ],
        ),
      ),
    );
  }
}
