import 'package:flutter/material.dart';

import '../models/taskModel.dart';

class Exercicio08 extends StatefulWidget {
  const Exercicio08({Key? key}) : super(key: key);

  @override
  State<Exercicio08> createState() => _Exercicio08State();
}

class _Exercicio08State extends State<Exercicio08> {
  List<TaskModel> listaTarefas = [];
  TextEditingController tarefaController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void adicionarTarefa(String task) {
    setState(() {
      listaTarefas.add(TaskModel(nome: task, concluido: false));
    });
    this.tarefaController.clear();
  }

  void estaConcluido(int index) {
    setState(() {
      listaTarefas[index].concluido = !listaTarefas[index].concluido;
    });
  }

  void editarTarefa(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String editedTask = listaTarefas[index].nome;
        return AlertDialog(
          title: const Text('Editar Tarefa'),
          content: TextFormField(
            initialValue: listaTarefas[index].nome,
            onChanged: (value) {
              editedTask = value;
            },
          ),
          actions: [
            FilledButton.tonal(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            FilledButton.tonal(
              onPressed: () {
                setState(() {
                  listaTarefas[index].nome = editedTask;
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

  int getTarefasConcluidas() {
    return listaTarefas.where((task) => task.concluido).length;
  }

  bool todasTarefasConcluidas() {
    return listaTarefas.isNotEmpty &&
        getTarefasConcluidas() == listaTarefas.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 08'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autofocus: true,
                      controller: tarefaController,
                      decoration: const InputDecoration(
                        labelText: "Tarefa",
                        border: OutlineInputBorder(),
                        hintText: "Digite uma tarefa!",
                      ),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Digite uma tarefa válida';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FilledButton.tonal(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        adicionarTarefa(tarefaController.text);
                      }
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listaTarefas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: listaTarefas[index].concluido
                        ? const Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : Icon(Icons.note_alt_rounded),
                    title: Text(
                      listaTarefas[index].nome,
                      style: listaTarefas[index].concluido
                          ? const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            )
                          : null,
                    ),
                    trailing: Checkbox(
                      value: listaTarefas[index].concluido,
                      onChanged: (value) {
                        estaConcluido(index);
                      },
                    ),
                    onLongPress: () {
                      editarTarefa(index);
                    },
                  );
                },
              ),
            ),
            Column(
              children: [
                if (todasTarefasConcluidas())
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage(
                        "assets/well_done.gif",
                      ),
                      height: 300,
                      width: 300,
                    ),
                  ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tarefas Concluídas: ${getTarefasConcluidas()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  if (todasTarefasConcluidas())
                    Icon(
                      Icons.emoji_events,
                      color: Colors.amber.shade600,
                      shadows: [Shadow(color: Colors.yellow, blurRadius: 10)],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
