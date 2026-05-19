import 'package:flutter/material.dart';
import '../widgets/components.dart';
import '../core/colors.dart';
import 'check_email_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Forgot Password?", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.primary)),
              const SizedBox(height: 12),
              const Text("To reset your password, you need your email or mobile number that can be authenticated", textAlign: TextAlign.center, style: TextStyle(color: AppColors.textLight)),
              const SizedBox(height: 30),

              Image.asset(
                'assets/images/key_img.png',
                height: 120,
                width: 120,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 30),
              const CustomTextField(label: "Email"),
              const SizedBox(height: 24),
              PrimaryButton(text: "RESET PASSWORD", onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckEmailScreen()))),
              const SizedBox(height: 16),
              SecondaryButton(text: "BACK TO LOGIN", onPressed: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }
}