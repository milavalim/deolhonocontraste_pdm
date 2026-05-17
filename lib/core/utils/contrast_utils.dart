import 'dart:ui'; // Importe a biblioteca de UI do Dart para usar a classe Color e outras funcionalidades relacionadas à interface do usuário.

class ContrastUtils {
  static double _luminance(Color color) {
    return color
        .computeLuminance(); // computeLuminance é um método da classe Color que calcula a luminância relativa de uma cor, que é um valor entre 0 e 1 que representa o quão clara ou escura a cor é. Esse valor é usado para calcular a razão de contraste entre duas cores.
  }

  static double contrastRatio(Color c1, Color c2) {
    final l1 = _luminance(c1);
    final l2 = _luminance(c2);

    final brightest = l1 > l2
        ? l1
        : l2; // Determine qual das duas cores é a mais clara (brightest) e qual é a mais escura (darkest) com base na luminância calculada. Isso é necessário para calcular a razão de contraste corretamente, pois a fórmula exige que a cor mais clara seja usada como o numerador e a cor mais escura como o denominador.
    final darkest = l1 > l2 ? l2 : l1;

    return (brightest + 0.05) / (darkest + 0.05);
  }

  static String getWCAGLevel(double ratio) {
    if (ratio >= 7) return "AAA";
    if (ratio >= 4.5) return "AA";
    return "Reprovado";
  }
}
