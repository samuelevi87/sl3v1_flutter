import 'package:flutter/material.dart';
import 'package:sl3v1_flutter/models/convidadoModel.dart';

class Exercicio07 extends StatefulWidget {
  const Exercicio07({super.key});

  @override
  State<Exercicio07> createState() => _Exercicio07State();
}

class _Exercicio07State extends State<Exercicio07> {
  List<ConvidadoModel> guests = [
    ConvidadoModel(
        nome: 'Almira', imagem: 'https://boredhumans.com/faces2/629.jpg'),
    ConvidadoModel(
        nome: 'Belina', imagem: 'https://boredhumans.com/faces2/955.jpg'),
    ConvidadoModel(
        nome: 'Pedro', imagem: 'https://boredhumans.com/faces2/125.jpg'),
    ConvidadoModel(
        nome: 'Carlos', imagem: 'https://boredhumans.com/faces2/123.jpg'),
  ];

  void adicionarConvidado(String nome, int numero) {
    String imagem = 'https://boredhumans.com/faces2/$numero.jpg';

    setState(() {
      guests.add(ConvidadoModel(nome: nome, imagem: imagem));
    });
  }

  void editarConvidado(String nomeAnterior, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String novoNome = guests[index].nome;

        return AlertDialog(
          title: const Text('Editar Convidado'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  novoNome = value;
                },
                decoration: InputDecoration(
                  labelText: 'Novo Nome',
                  hintText: guests[index].nome,
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  guests[index].nome = novoNome;
                });
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercício 07'),
      ),
      body: ListView.builder(
        itemCount: guests.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(guests[index].imagem)),
            title: Text(guests[index].nome),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    editarConvidado(guests[index].nome, index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      guests.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String nome = '';
              int numero = 0;

              return AlertDialog(
                title: const Text('Adicionar Convidado'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) {
                        nome = value;
                      },
                      decoration: const InputDecoration(labelText: 'Nome'),
                    ),
                    TextField(
                      onChanged: (value) {
                        numero = int.tryParse(value) ?? 0;
                      },
                      decoration:
                          const InputDecoration(labelText: 'Id da Foto'),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      adicionarConvidado(nome, numero);
                      Navigator.pop(context);
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
