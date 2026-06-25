import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_text_field.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';

/// Página de Login do aplicativo.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              // Logo ou Título
              const Icon(
                Icons.remove_red_eye,
                size: 80,
                color: AppColors.tealBlue,
              ),
              const SizedBox(height: 16),
              const Text(
                'Olho no Contraste',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.tealBlue,
                ),
              ),
              const SizedBox(height: 40),

              const CustomTextField(
                label: 'E-mail',
                hint: 'seu@email.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Senha',
                hint: '********',
                isPassword: true,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ForgotPasswordPage(),
                    ),
                  ),
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: AppColors.tealBlue),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              CustomButton(
                text: 'ENTRAR',
                onPressed: () {
                  // Aqui entraria a lógica de login
                },
              ),

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Não tem uma conta?'),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterPage()),
                    ),
                    child: const Text(
                      'Cadastre-se',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.tealBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
