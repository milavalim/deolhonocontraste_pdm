import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_text_field.dart';

/// Página de Cadastro de novos usuários.
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.tealBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Junte-se à nossa comunidade de acessibilidade.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            const CustomTextField(
              label: 'Nome Completo',
              hint: 'Ex: Camila Valim',
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              label: 'E-mail',
              hint: 'exemplo@email.com',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              label: 'Senha',
              hint: 'Mínimo 6 caracteres',
              isPassword: true,
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              label: 'Confirmar Senha',
              hint: 'Repita a senha',
              isPassword: true,
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'CADASTRAR',
              onPressed: () {
                // Lógica de cadastro
              },
            ),
          ],
        ),
      ),
    );
  }
}
