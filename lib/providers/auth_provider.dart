import 'package:flutter/material.dart';

import '../models/user_model.dart';

enum AuthStatus { authenticated, unauthenticated }

class AuthProvider with ChangeNotifier {
  AuthStatus _authStatus = AuthStatus.unauthenticated;
  User? _currentUser;

  AuthStatus get authStatus => _authStatus;

  // Método para obter o usuário atual
  User currentUser() {
    if (_authStatus == AuthStatus.authenticated && _currentUser != null) {
      return _currentUser!;
    } else {
      throw Exception('Usuário não autenticado');
    }
  }

  // Simulando o processo de autenticação
  Future<User?> signIn(String email, String password) async {
    await Future.delayed(
        Duration(seconds: 2)); // Simulando a autenticação por 2 segundos

    // Verificando se o usuário existe na lista
    User? user = users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () => throw "Credencial Inválida",
    );

    if (user != null) {
      // User found, set auth status and current user
      _authStatus = AuthStatus.authenticated;
      _currentUser = user;
    } else {
      // User not found, throw an exception
      throw Exception('Invalid credentials');
    }

    notifyListeners();

    return user; // Return the user or null
  }

  // Método para sair da sessão (deslogar)
  void signOut() {
    _authStatus = AuthStatus.unauthenticated;
    _currentUser = null;

    notifyListeners();
  }
}
