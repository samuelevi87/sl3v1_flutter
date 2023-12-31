/**
 *Crie uma tela, utilizando a estrutura padrão de layout (Scaffold).
 * Nesta tela, deverão ser exibidos três textos, sendo exibidos um em cima do outro.
 * Adicione um espaço no texto do meio, para que os três não fiquem muito colados
 */

import 'package:flutter/material.dart';

import 'main_home.dart';

class Exercicio02 extends StatefulWidget {
  const Exercicio02({super.key});

  @override
  State<Exercicio02> createState() => _Exercicio02State();
}

class _Exercicio02State extends State<Exercicio02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercício 02'),
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
              child: Text('Crie uma tela, utilizando a estrutura padrão de layout (Scaffold). Nesta tela, deverão ser exibidos três textos, sendo exibidos um em cima do outro. Adicione um espaço no texto do meio, para que os três não fiquem muito colados',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Texto 01'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Texto 02'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Texto 03'),
                  ),
                ],
            ),
          ),
        ],
      ),
    );
  }
}
