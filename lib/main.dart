import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_strings.dart';
import 'shared/main_scaffold.dart'; // Novo componente de navegação

/// Ponto de entrada do aplicativo Olho no Contraste.
void main() {
  runApp(const ContrastApp());
}

class ContrastApp extends StatelessWidget {
  const ContrastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,

      // ThemeData define as cores globais.
      // Se um widget não usar 'Theme.of(context)', ele usará cores padrão do Flutter (como o azul e roxo).
      theme: AppTheme.lightTheme,

      // Home é um Scaffold que contém a barra de menu inferior
      home: const MainScaffold(),
    );
  }
}
