import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Definição do tema visual do aplicativo seguindo o estilo minimalista.
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.tealBlue,
      scaffoldBackgroundColor: AppColors.lightYellow,

      // Configuração de fontes (Moderna sem serifa)
      fontFamily:
          'Roboto', // Flutter usa Roboto como padrão, que é moderna e sans-serif

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.tealBlue,
        foregroundColor: AppColors.lightYellow,
        elevation: 0,
        centerTitle: true,
      ),

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.tealBlue,
        primary: AppColors.tealBlue,
        secondary: AppColors.tealBlue,
        surface: AppColors.white,
        background: AppColors.lightYellow,
      ),

      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: AppColors.tealBlue,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        bodyLarge: TextStyle(color: AppColors.black, fontSize: 16),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.tealBlue,
          foregroundColor: AppColors.lightYellow,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
