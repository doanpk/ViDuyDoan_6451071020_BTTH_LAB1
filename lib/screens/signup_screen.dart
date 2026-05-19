import 'package:flutter/material.dart';
import '../widgets/components.dart';
import '../core/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text("Create an Account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primary)),
              const SizedBox(height: 8),
              const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", textAlign: TextAlign.center, style: TextStyle(color: AppColors.textLight)),
              const SizedBox(height: 30),

              const CustomTextField(label: "Full name"),
              const SizedBox(height: 16),
              const CustomTextField(label: "Email"),
              const SizedBox(height: 16),
              const CustomTextField(label: "Password", isPassword: true),
              const SizedBox(height: 16),

              const RememberMeCheckbox(),

              const SizedBox(height: 24),
              PrimaryButton(text: "SIGN UP", onPressed: () {}),
              const SizedBox(height: 16),
              const GoogleButton(text: "SIGN UP WITH GOOGLE"),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You already have an account? ", style: TextStyle(color: AppColors.textLight, fontSize: 12)),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text("Sign in", style: TextStyle(color: AppColors.orange, fontWeight: FontWeight.bold, fontSize: 12, decoration: TextDecoration.underline)),
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