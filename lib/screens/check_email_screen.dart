import 'package:flutter/material.dart';
import '../widgets/components.dart';
import '../core/colors.dart';
import 'success_screen.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Check Your Email", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.primary)),
              const SizedBox(height: 12),
              const Text("We have sent the reset password to the email address brandonelouis@gmail.com", textAlign: TextAlign.center, style: TextStyle(color: AppColors.textLight)),
              const SizedBox(height: 40),

              Image.asset(
                'assets/images/email_img.png',
                height: 120,
                width: 120,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),
              PrimaryButton(text: "OPEN YOUR EMAIL", onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SuccessScreen()))),
              const SizedBox(height: 16),
              SecondaryButton(text: "BACK TO LOGIN", onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst)),
            ],
          ),
        ),
      ),
    );
  }
}