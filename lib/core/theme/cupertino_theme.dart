import 'package:flutter/cupertino.dart';
import '../constants/app_colors.dart';

/// Configuração do tema Cupertino para componentes que seguem o estilo iOS.
class AppCupertinoTheme {
  static CupertinoThemeData get theme {
    return const CupertinoThemeData(
      primaryColor: AppColors.tealBlue,
      scaffoldBackgroundColor: AppColors.lightYellow,
      barBackgroundColor: AppColors.tealBlue,
      textTheme: CupertinoTextThemeData(
        primaryColor: AppColors.tealBlue,
        navTitleTextStyle: TextStyle(
          color: AppColors.lightYellow,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
