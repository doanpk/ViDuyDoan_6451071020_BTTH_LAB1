import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/colors.dart';
import 'presentation/screens/logo_screen.dart';

void main() async {
  // Bắt buộc phải có dòng này để Flutter chuẩn bị nền tảng trước khi gọi Firebase
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Khởi động Firebase
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print("Firebase initialization error: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jobspot',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Poppins',
      ),
      home: const LogoScreen(),
    );
  }
}
