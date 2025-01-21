import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../utils/constants.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(
                'assets/imagen_inicio.jpg',
                height: 200,
              ),
              const SizedBox(height: 16),
              Text(
                AppConstants.version,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),
              //Image.asset('assets/security_illustration.png', height: 200),
              const SizedBox(height: 24),
              const Text(
                'Cuida tus contraseñas, no las compartas con nadie.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              _buildLoginOption(
                context,
                'Usuario y contraseña',
                Icons.person_outline,
                    () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                ),
              ),
              const SizedBox(height: 16),
              _buildLoginOption(
                context,
                'Huella / Face ID',
                Icons.fingerprint,
                    () {},
              ),
              const SizedBox(height: 16),
              _buildLoginOption(
                context,
                'Pin de 6 dígitos',
                Icons.lock_outline,
                    () {},
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(Icons.location_on, 'Ubicanos'),
                  _buildActionButton(Icons.key, 'Clave digital'),
                  _buildActionButton(Icons.message, 'Escríbenos'),
                ],
              ),
              const SizedBox(height: 32),
              TextButton(
                onPressed: () {},
                child: Text(
                  '¿Problemas para ingresar?',
                  style: TextStyle(
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginOption(
      BuildContext context,
      String title,
      IconData icon,
      VoidCallback onTap,
      ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppColors.primary, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

