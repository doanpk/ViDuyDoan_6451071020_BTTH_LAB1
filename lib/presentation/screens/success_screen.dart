import 'package:flutter/material.dart';
import '../widgets/components.dart';
import '../../core/colors.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Successfully", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.primary)),
              const SizedBox(height: 12),
              const Text("Your password has been updated, please change your password regularly to avoid this happening", textAlign: TextAlign.center, style: TextStyle(color: AppColors.textLight)),
              const SizedBox(height: 40),

              Image.asset(
                'assets/images/success_img.png',
                height: 120,
                width: 120,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),
              PrimaryButton(text: "CONTINUE", onPressed: () {}),
              const SizedBox(height: 16),
              SecondaryButton(text: "BACK TO LOGIN", onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst)),
            ],
          ),
        ),
      ),
    );
  }
}