import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

/// Widget de botão personalizado seguindo a identidade visual do app.
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSecondary;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSecondary ? AppColors.white : AppColors.tealBlue,
        foregroundColor: isSecondary
            ? AppColors.tealBlue
            : AppColors.lightYellow,
        side: isSecondary ? const BorderSide(color: AppColors.tealBlue) : null,
        elevation: isSecondary ? 0 : 2,
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
