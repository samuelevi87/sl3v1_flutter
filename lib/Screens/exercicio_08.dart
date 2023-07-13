import 'package:flutter/material.dart';

import '../models/taskModel.dart';

class Exercicio08 extends StatefulWidget {
  const Exercicio08({Key? key}) : super(key: key);

  @override
  State<Exercicio08> createState() => _Exercicio08State();
}

class _Exercicio08State extends State<Exercicio08> {
  List<TaskModel> tasks = [];
  TextEditingController task = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void adicionarTarefa(String task) {
    setState(() {
      tasks.add(TaskModel(nome: task, completed: false));
    });
    this.task.clear();
  }

  void toggleConclusao(int index) {
    setState(() {
      tasks[index].completed = !tasks[index].completed;
    });
  }

  void editarTarefa(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Tarefa'),
          content: TextFormField(
            initialValue: tasks[index].nome,
            onChanged: (value) {
              tasks[index].nome = value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
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
    return tasks.where((task) => task.completed).length;
  }

  bool todasTarefasConcluidas() {
    return tasks.isNotEmpty && getTarefasConcluidas() == tasks.length;
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
                      controller: task,
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
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      adicionarTarefa(task.text);
                    }
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: tasks[index].completed
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : Icon(Icons.note_alt_rounded),
                    title: Text(
                      tasks[index].nome,
                      style: tasks[index].completed
                          ? TextStyle(
                              decoration: TextDecoration.lineThrough,
                            )
                          : null,
                    ),
                    trailing: Checkbox(
                      value: tasks[index].completed,
                      onChanged: (value) {
                        toggleConclusao(index);
                      },
                    ),
                    onLongPress: () {
                      editarTarefa(index);
                    },
                  );
                },
              ),
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
