import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'firebase_options.dart';
import 'core/colors.dart';
import 'presentation/screens/logo_screen.dart';
import 'presentation/screens/profile_screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  // Bắt buộc phải có dòng này để Flutter chuẩn bị nền tảng trước khi gọi Firebase
  WidgetsFlutterBinding.ensureInitialized();

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  // Khởi tạo sqflite_common_ffi cho desktop (Windows, Linux), nhưng bỏ qua nếu chạy trên Web
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  try {
    // Khởi động Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
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
      home: const ProfileScreen(),
    );
  }
}
