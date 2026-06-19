import 'package:flutter/material.dart';
import 'package:pdm1_010526/core/constants/app_colors.dart';

/// Widget que exibe uma prévia visual de como o texto aparece sobre o fundo.
class ContrastPreview extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;

  const ContrastPreview({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.tealBlue.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exemplo de Título',
            style: TextStyle(
              color: foregroundColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Este é um exemplo de como o texto e os componentes visuais serão percebidos pelos usuários com estas cores.',
            style: TextStyle(color: foregroundColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
