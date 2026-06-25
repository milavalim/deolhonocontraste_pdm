import 'dart:math';
import 'package:flutter/material.dart';

/// Classe utilitária que contém a lógica matemática para acessibilidade visual
/// Segue rigorosamente as fórmulas definidas pelo W3C (WCAG 2.1)
class ContrastUtils {
  /// Método  para cálculo de razão de contraste
  /// Ideia: Determine qual das duas cores é a mais clara (brightest) e qual é a mais escura (darkest) com base na luminância calculada.
  /// Isso é necessário para calcular a razão de contraste corretamente, pois a fórmula exige que a cor mais clara seja usada como o numerador e a cor mais escura como o denominador.
  static double contrastRatio(Color c1, Color c2) {
    // Corrigido: Agora chama o método _luminance corretamente
    final l1 = _luminance(c1);
    final l2 = _luminance(c2);

    final brightest = l1 > l2 ? l1 : l2;
    final darkest = l1 > l2 ? l2 : l1;

    return (brightest + 0.05) / (darkest + 0.05);
  }

  /// Alias para o método contrastRatio, caso algum arquivo chame por este nome
  static double calculateContrastRatio(Color color1, Color color2) {
    return contrastRatio(color1, color2);
  }

  /// Retorna o nível WCAG em formato de texto.
  static String getWCAGLevel(double ratio) {
    if (ratio >= 7) return "AAA";
    if (ratio >= 4.5) return "AA";
    return "Reprovado";
  }

  /// Método privado para calcular a Luminância Relativa.
  /// Ajustado para que o método opere normalmente sem erros de "variável não declarada".
  static double _luminance(Color color) {
    double R = color.red / 255.0;
    double G = color.green / 255.0;
    double B = color.blue / 255.0;

    R = (R <= 0.03928) ? R / 12.92 : pow((R + 0.055) / 1.055, 2.4).toDouble();
    G = (G <= 0.03928) ? G / 12.92 : pow((G + 0.055) / 1.055, 2.4).toDouble();
    B = (B <= 0.03928) ? B / 12.92 : pow((B + 0.055) / 1.055, 2.4).toDouble();

    return 0.2126 * R + 0.7152 * G + 0.0722 * B;
  }

  /// Mantido por compatibilidade com outros arquivos que possam usar o nome antigo
  static double calculateRelativeLuminance(Color color) {
    return _luminance(color);
  }
}
