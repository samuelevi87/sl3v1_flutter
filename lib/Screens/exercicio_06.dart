import 'package:flutter/material.dart';
import 'package:sl3v1_flutter/widgets/senhaField.dart';

class Exercicio06 extends StatefulWidget {
  const Exercicio06({super.key});

  @override
  State<Exercicio06> createState() => _Exercicio06State();
}

class _Exercicio06State extends State<Exercicio06> {
  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercício 06"),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Criar uma página de login, com um campo de login, um campo de senha e um botão de login. Regras: - O campo de Login é obrigatório, se não estiver preenchido, você deve avisar o usuário; - O campo senha precisa ter no mínimo 6 caracteres; - O campo senha pode ter no máximo 12 caracteres;',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.justify),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Image(
                    image: AssetImage("assets/butler-devil.png"),
                    height: 100,
                    width: 100,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Login",
                    hintText: "Digite seu usuário!",
                    border: OutlineInputBorder(),
                  ),
                  controller: loginController,
                  validator: (value) {
                    if (value == null) return "O valor informado é nulo";
                    if (value!.trim().isEmpty) return "O usuário é obrigatório";
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SenhaField(),
                SizedBox(height: 20.0),
                FilledButton.tonal(
                    onPressed: () {
                      if (this.formKey.currentState!.validate()) {
                        print("Salvando dados");
                      }
                    },
                    child: const Icon(Icons.save))
              ],
            )),
      ),
    );
  }
}
