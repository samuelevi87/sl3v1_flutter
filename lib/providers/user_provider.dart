import 'package:flutter/material.dart';
import 'package:sl3v1_flutter/providers/auth_provider.dart';

import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  AuthProvider authProvider = AuthProvider();
  User? _currentUser;

  User? get currentUser => _currentUser;

  // ...

  // Simulando o processo de carregamento do usuário logado (substitua esse método com sua lógica real)
  Future<User?> loadCurrentUser() async {
    // ...

    // Verificando se há um usuário autenticado na AuthProvider
    if (authProvider.authStatus == AuthStatus.authenticated) {
      // Invocar a função para obter o usuário atual
      User? currentUser = authProvider.currentUser();

      if (currentUser != null) {
        // Carregue o usuário atual da lista com base no email fornecido pela AuthProvider
        _currentUser = users.firstWhere(
          (user) => user.email == currentUser.email,
          orElse: () => throw "Credencial Inválida no UserProvider",
        );
      } else {
        _currentUser = null;
      }
    } else {
      _currentUser = null;
    }

    notifyListeners();
  }

  // Simulando a atualização do usuário (substitua esse método com sua lógica real)
  Future<void> updateCurrentUser(User updatedUser) async {
    // ...

    // Verificando se há um usuário autenticado na AuthProvider
    if (authProvider.authStatus == AuthStatus.authenticated) {
      // Invocar a função para obter o usuário atual
      User? currentUser = authProvider.currentUser();

      if (currentUser != null) {
        // Atualize os dados do usuário na lista com base no email fornecido pela AuthProvider
        int index = users.indexWhere((user) => user.email == currentUser.email);
        if (index >= 0) {
          users[index] = updatedUser;
          _currentUser = updatedUser;
        }
      }
    }

    notifyListeners();
  }
}
