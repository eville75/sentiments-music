import 'package:flutter/material.dart';
import '../../design_system/theme/app_theme.dart';
import '../../design_system/theme/app_typography.dart';
import '../../design_system/theme/app_spacing.dart';
import '../../design_system/theme/app_colors.dart';
import '../mood/mood_factory.dart';
import 'login_view_model.dart';
import 'login_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginViewModel viewModel;

  bool isLogin = true;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = LoginViewModel(service: LoginService());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppTheme.backgroundGradient,
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  isLogin ? "Entrar" : "Criar conta",
                  style: AppTypography.h1,
                ),
                const SizedBox(height: 32),

                // CAMPO NOME (somente no cadastro)
                if (!isLogin)
                  _textField("Nome completo", controller: nameController),

                if (!isLogin) const SizedBox(height: 16),

                // CAMPO EMAIL
                _textField("E-mail", controller: emailController),

                const SizedBox(height: 16),

                // CAMPO SENHA
                _textField("Senha", controller: passController, obscure: true),

                const SizedBox(height: 32),

                _button(
                  text: isLogin ? "Entrar" : "Cadastrar",
                  onTap: () async {
                    if (isLogin) {
                      final user = await viewModel.login(
                        emailController.text,
                        passController.text,
                      );

                      if (user != null && mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MoodFactory.create(user),
                          ),
                        );
                      }
                    } else {
                      final user = await viewModel.register(
                        nameController.text,
                        emailController.text,
                        passController.text,
                      );

                      if (user != null && mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MoodFactory.create(user),
                          ),
                        );
                      }
                    }
                  },
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin ? "Criar uma conta" : "Já tenho uma conta",
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField(
    String label, {
    required TextEditingController controller,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white24),
        ),
      ),
    );
  }

  Widget _button({required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTypography.body.copyWith(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
