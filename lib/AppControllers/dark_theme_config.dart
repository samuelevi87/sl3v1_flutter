import 'package:flutter/material.dart';

class DarkThemeConfig extends ChangeNotifier{
  //Padrão Singleton para garantir que será a mesma instância da configuração do tema para a página e para o widget.
  static DarkThemeConfig instance = DarkThemeConfig();
  bool isDarkTheme = false;
  changeTheme(){
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}