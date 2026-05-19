import 'package:flutter/material.dart';
import '../widgets/components.dart';
import '../core/colors.dart';
import 'signup_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text("Welcome Back", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primary)),
              const SizedBox(height: 8),
              const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", textAlign: TextAlign.center, style: TextStyle(color: AppColors.textLight)),
              const SizedBox(height: 40),

              const CustomTextField(label: "Email"),
              const SizedBox(height: 16),
              const CustomTextField(label: "Password", isPassword: true),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RememberMeCheckbox(),

                  TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPasswordScreen())),
                      child: const Text("Forgot Password ?", style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold))
                  )
                ],
              ),
              const SizedBox(height: 24),
              PrimaryButton(text: "LOGIN", onPressed: () {}),
              const SizedBox(height: 16),
              const GoogleButton(text: "SIGN IN WITH GOOGLE"),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You don't have an account yet? ", style: TextStyle(color: AppColors.textLight, fontSize: 12)),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpScreen())),
                    child: const Text("Sign up", style: TextStyle(color: AppColors.orange, fontWeight: FontWeight.bold, fontSize: 12, decoration: TextDecoration.underline)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}