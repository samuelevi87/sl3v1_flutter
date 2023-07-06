/**
 *Crie uma tela, utilizando a estrutura padrão de layout (Scaffold).
 *Nesta tela, deve existir um texto centralizado (o que está escrito fica a seu critério).
 * Esse texto deve estar em negrito, com um tamanho de fonte igual a 24
 *///


import 'package:flutter/material.dart';

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
      ),
      body: Center(
        child: Container(
          child: Text('Exercício 01',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Segoe UI'
          ),),
        ),
      ),
    );
  }
}
