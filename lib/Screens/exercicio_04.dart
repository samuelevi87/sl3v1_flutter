import 'package:flutter/material.dart';

enum CalcOperacao { soma, subtracao, multiplicacao, divisao }

class Exercicio04 extends StatefulWidget {
  const Exercicio04({super.key});

  @override
  State<Exercicio04> createState() => _Exercicio04State();
}

class _Exercicio04State extends State<Exercicio04> {
  TextEditingController valor1 = TextEditingController();
  TextEditingController valor2 = TextEditingController();

  double resultado = 0;
  String mensagemErro = "";

  void _calcular(CalcOperacao operacao) {
    try {
      double? v1 = double.tryParse(valor1.text);
      double? v2 = double.tryParse(valor2.text);
      double result = 0;

      if (v1 == null) throw "O valor 1 é inválido: ${valor1.text}";

      if (v2 == null) throw "O valor 2 é inválido ${valor2.text}";

      switch (operacao) {
        case CalcOperacao.soma:
          result = v1! + v2!;
          break;

        case CalcOperacao.subtracao:
          result = v1! - v2!;
          break;

        case CalcOperacao.multiplicacao:
          result = v1! * v2!;
          break;

        case CalcOperacao.divisao:
          if (v2! == 0) throw "A divisão por zero é inválida";

          result = v1! / v2!;
          break;
      }

      setState(() {
        resultado = result;
      });
    } catch (e) {
      setState(() {
        this.mensagemErro = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercício 4"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: valor1,
                decoration: InputDecoration(
                  labelText: "Valor 1",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: valor2,
                decoration: InputDecoration(
                  labelText: "Valor 2",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.tonal(
                    onPressed: () => _calcular(CalcOperacao.soma),
                    child: Text("+")),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: FilledButton.tonal(
                      onPressed: () => _calcular(CalcOperacao.subtracao),
                      child: Text("-")),
                ),
                FilledButton.tonal(
                    onPressed: () => _calcular(CalcOperacao.multiplicacao),
                    child: Text("*")),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: FilledButton.tonal(
                      onPressed: () => _calcular(CalcOperacao.divisao),
                      child: Text("/")),
                )
              ],
            ),
            (this.mensagemErro.isEmpty
                ? Text(
              "= ${this.resultado}",
              style: TextStyle(fontSize: 44),
            )
                : Text(
              this.mensagemErro,
              style: TextStyle(fontSize: 60, color: Colors.red),
            ))
          ],
        ),
      ),
    );
  }
}
