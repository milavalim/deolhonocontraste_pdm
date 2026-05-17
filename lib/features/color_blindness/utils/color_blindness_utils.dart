// ignore_for_file: deprecated_member_use

import 'dart:ui'; // dart:ui é uma biblioteca que fornece classes e funções para manipulação de cores, gráficos, etc. Assim, consigo usar a classe Color.

class ColorBlindnessUtils {
  static Color protanopia(Color color) {
    // static color protanopia = função que recebe uma cor e retorna a cor simulada para cegueira de vermelho.
    final r = (color.red * 255).toInt();
    final g = (color.green * 255).toInt();
    final b = (color.blue * 255)
        .toInt(); // O valor de cada canal de cor (vermelho, verde e azul) é extraído da cor original e multiplicado por 255 para obter um valor inteiro entre 0 e 255.

    return Color.fromARGB(
      // Color.fromARGB é um construtor que cria uma nova cor a partir dos valores de alfa, vermelho, verde e azul. O valor alfa é definido como 255 (totalmente opaco), e os valores de vermelho, verde e azul são calculados.
      255,
      (0.56667 * r + 0.43333 * g).toInt(),
      (0.55833 * r + 0.44167 * g).toInt(),
      (0.24167 * g + 0.75833 * b).toInt(),
    );
  }

  static Color deuteranopia(Color color) {
    final r = (color.red * 255).toInt();
    final g = (color.green * 255).toInt();
    final b = (color.blue * 255).toInt();

    return Color.fromARGB(
      255,
      (0.625 * r + 0.375 * g).toInt(),
      (0.7 * r + 0.3 * g).toInt(),
      (0.3 * g + 0.7 * b).toInt(),
    );
  }

  static Color tritanopia(Color color) {
    final r = (color.red * 255).toInt();
    final g = (color.green * 255).toInt();
    final b = (color.blue * 255).toInt();

    return Color.fromARGB(
      255,
      (0.95 * r + 0.05 * g).toInt(),
      (0.43333 * g + 0.56667 * b).toInt(),
      (0.475 * g + 0.525 * b).toInt(),
    );
  }
}
