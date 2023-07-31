import 'package:flutter/material.dart';
import 'package:sl3v1_flutter/models/personModel.dart';

import 'exercicio_12_pag_conf.dart';

class Exercicio12 extends StatefulWidget {
  const Exercicio12({super.key});

  @override
  State<Exercicio12> createState() => _Exercicio12State();
}

class _Exercicio12State extends State<Exercicio12> {
  List<PersonModel> pessoas = [
    PersonModel("Mary Jane", "mary.jane@email.com",
        "https://boredhumans.com/faces2/955.jpg"),
    PersonModel("Clarisse Lispector", "clarisp@email.com",
        "https://boredhumans.com/faces2/629.jpg"),
    PersonModel("Pedro Gomes", "gomes.pedro@email.com",
        "https://boredhumans.com/faces2/123.jpg"),
    PersonModel("Peter Prius", "priuslucky@email.com",
        "https://boredhumans.com/faces2/125.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pessoas'),
      ),
      body: ListView.builder(
        itemCount: pessoas.length,
        itemBuilder: (context, index) {
          final pessoa = pessoas[index];
          return ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(pessoas[index].imagem)),
            title: Text(pessoas[index].nome),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmarExclusao(
                      pessoa: pessoas[index].nome,
                      aoDeletar: () {
                        setState(() {
                          pessoas.removeAt(index);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
