import 'package:flutter/material.dart';

/// Utilitário para converter cores entre diferentes formatos.
/// Útil para transformar strings hexadecimais em objetos Color e vice-versa.
class ColorConversionUtils {
  /// Converte uma string HEX (ex: #FFFFFF ou FFFFFF) para um objeto Color.
  /// Se a string for inválida, retorna a cor cinza por padrão.
  static Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    // Remove o caractere '#' se existir
    if (hexString.startsWith('#')) hexString = hexString.substring(1);

    // Se tiver 6 caracteres (RRGGBB), adiciona 'FF' para a opacidade total
    if (hexString.length == 6) buffer.write('ff');
    buffer.write(hexString);

    try {
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      // Caso o usuário digite algo que não seja um número hexadecimal válido
      return Colors.grey;
    }
  }

  /// Converte um objeto Color para uma string HEX (ex: #FFFFFF).
  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }
}
