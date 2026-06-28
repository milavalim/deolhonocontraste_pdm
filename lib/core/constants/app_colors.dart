import 'package:flutter/material.dart';

/// Classe que centraliza as cores utilizadas no aplicativo.
class AppColors {
  // Azul Petróleo (Cor principal)
  static const Color tealBlue = Color.fromARGB(255, 0, 77, 60);

  // Amarelo Claro (Cor de fundo)
  static const Color lightYellow = Color(0xFFFFFDE7);

  // Cores Neutras
  static const Color white = Colors.white;
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color grey = Color.fromARGB(255, 128, 128, 128);

  // Cores de Feedback (Acessibilidade)
  static const Color success = Color(0xFF2E7D32); // Verde para aprovado na WCAG
  static const Color warning = Color(
    0xFFF9A825,
  ); // Amarelo/Laranja para atenção
  static const Color error = Color(
    0xFFC62828,
  ); // Vermelho para falha no contraste
}
