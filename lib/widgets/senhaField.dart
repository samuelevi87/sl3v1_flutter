import 'package:flutter/material.dart';

class SenhaField extends StatefulWidget {
  const SenhaField({super.key});

  @override
  State<SenhaField> createState() => _SenhaFieldState();
}

class _SenhaFieldState extends State<SenhaField> {
  bool _obscureText = true;
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 12,
      obscureText: _obscureText,
      decoration: InputDecoration(
          labelText: "Senha",
          hintText: "Digite sua Senha!",
          border: OutlineInputBorder(),
          suffixIcon: IconButton(onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          }, icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off))
      ),
      controller: senhaController,
      validator: (value) {
        if (value == null) return "A senha não pode ser nula";
        if (value!.trim().isEmpty) return "Informe a senha!";
        if ((value!.length < 6) || value!.length > 12) {
          return "A senha deve ter entre 6 e 12 caracteres!";
        }
        if (value == "123456") {
          return "Essa senha jé é usada pelo usuário pedro23, escolha outra!";
        }
      },
    );
  }
}
