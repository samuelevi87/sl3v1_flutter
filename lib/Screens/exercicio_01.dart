/**
 *Crie uma tela, utilizando a estrutura padrão de layout (Scaffold).
 *Nesta tela, deve existir um texto centralizado (o que está escrito fica a seu critério).
 * Esse texto deve estar em negrito, com um tamanho de fonte igual a 24
 *///


import 'package:flutter/material.dart';
import 'package:sl3v1_flutter/Screens/main_home.dart';

class Exercicio01 extends StatefulWidget {
  const Exercicio01({super.key});

  @override
  State<Exercicio01> createState() => _Exercicio01State();
}

class _Exercicio01State extends State<Exercicio01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercício 1'),
        actions: const [
          CustomSwitch(),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Crie uma tela, utilizando a estrutura padrão de layout (Scaffold). Nesta tela, deve existir um texto centralizado (o que está escrito fica a seu critério). Esse texto deve estar em negrito, com um tamanho de fonte igual a 24',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.justify),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Exercício 01',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Segoe UI'
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
