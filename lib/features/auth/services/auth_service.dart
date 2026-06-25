import '../models/user.dart';

/// Serviço que gerencia a lógica de autenticação.
/// Em um cenário real, este serviço faria requisições HTTP para um servidor PHP.
class AuthService {
  /// Simula o login do usuário.
  Future<User?> login(String email, String password) async {
    // Simula um atraso de rede
    await Future.delayed(const Duration(seconds: 2));

    // Simulação de sucesso acadêmico
    if (email.contains('@')) {
      return User(id: '1', name: 'Estudante PDM', email: email);
    }
    return null;
  }

  /// Simula o cadastro de um novo usuário.
  Future<bool> register(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  /// Simula a recuperação de senha.
  Future<void> recoverPassword(String email) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
