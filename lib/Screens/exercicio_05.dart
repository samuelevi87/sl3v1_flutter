

import 'package:flutter/material.dart';

class Exercicio05 extends StatefulWidget {
  const Exercicio05({super.key});

  @override
  State<Exercicio05> createState() => _Exercicio05State();
}

class _Exercicio05State extends State<Exercicio05> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 05'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Crie uma tela que exiba duas imagens, utilizando o NetworkImage e o AssetImage.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.justify),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Image(image: NetworkImage('https://wol.jw.org/pt/wol/mp/r5/lp-t/mwb23/2023/577')),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Image(image: AssetImage("assets/326.jpg"),
              semanticLabel: "Continue a persistir em oração!",
              colorBlendMode: BlendMode.clear,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(image: AssetImage("assets/jw.gif"),
              semanticLabel: "Visite nosso site!",
              height: 100,
              width: 100,),
            ),

          ],
        ),
      ),
    );
  }
}
