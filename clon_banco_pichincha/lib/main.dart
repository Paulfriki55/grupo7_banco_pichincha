import 'package:flutter/material.dart';
import 'package:clon_banco_pichincha/screens/login_screen.dart';

void main() {
  runApp(const BancoApp());
}

class BancoApp extends StatelessWidget {
  const BancoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco Pichincha',
      theme: ThemeData(
        primaryColor: const Color(0xFF003B70),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF003B70),
          primary: const Color(0xFF003B70),
          secondary: Colors.yellow,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}