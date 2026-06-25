import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

/// Formulário de contraste ajustado para usar a identidade visual correta.
class ContrastForm extends StatelessWidget {
  final TextEditingController bgController;
  final TextEditingController fgController;
  final VoidCallback onCalculate;

  const ContrastForm({
    super.key,
    required this.bgController,
    required this.fgController,
    required this.onCalculate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField(
          label: AppStrings.backgroundColor,
          controller: bgController,
          hint: '#FFFFFF',
        ),
        const SizedBox(height: 16),
        _buildTextField(
          label: AppStrings.foregroundColor,
          controller: fgController,
          hint: '#000000',
        ),
        const SizedBox(height: 24),

        // Botão com Identidade Visual (Azul Petróleo)
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: onCalculate,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.tealBlue,
              foregroundColor: AppColors.lightYellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              AppStrings.checkContrast,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.tealBlue,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.tealBlue.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
