import 'package:flutter/material.dart';

class ConfirmarExclusao extends StatelessWidget {
  final String pessoa;
  final VoidCallback aoDeletar;

  const ConfirmarExclusao(
      {super.key, required this.pessoa, required this.aoDeletar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmar Exclusão'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.question_mark,
                  size: 50,
                ),
              ),
              Text(
                'Deseja excluir $pessoa?',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: aoDeletar,
                child: Text('Sim, excluir'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
