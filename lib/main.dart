import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/screen/auth_options.dart';
import 'package:telead_e_learning/screen/login.dart';
import 'package:telead_e_learning/screen/register.dart';
import 'package:telead_e_learning/screen/splash.dart';
import 'package:telead_e_learning/screen/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Telead E-learning App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Login(),
        );
      },
    );
  }
}
