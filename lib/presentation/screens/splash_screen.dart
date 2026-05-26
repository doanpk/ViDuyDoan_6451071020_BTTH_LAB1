import 'package:flutter/material.dart';
import '../../core/colors.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(alignment: Alignment.topRight, child: Text("Jobspot", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/splash_img.png',
                    height: 300,
                    fit: BoxFit.contain,
                  )
                ),
              ),
              const Text("Find Your\nDream Job\nHere!", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, height: 1.1, color: AppColors.textMain)),
              const SizedBox(height: 16),
              const Text("Explore all the most exciting job roles based\non your interest and study major.", style: TextStyle(color: AppColors.textLight)),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: AppColors.primary,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}