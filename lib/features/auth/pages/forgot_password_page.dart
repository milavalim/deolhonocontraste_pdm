import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_text_field.dart';

/// Página para recuperação de senha.
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Senha'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.tealBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Insira seu e-mail cadastrado para receber as instruções de recuperação.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            const CustomTextField(
              label: 'E-mail',
              hint: 'seu@email.com',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'ENVIAR E-MAIL',
              onPressed: () {
                // Lógica de envio
              },
            ),
          ],
        ),
      ),
    );
  }
}
