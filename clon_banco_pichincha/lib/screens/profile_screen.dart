import 'package:flutter/material.dart';
import '../components/bottom_navigation.dart';
import '../utils/constants.dart';
import 'home_screen.dart'; // Import HomeScreen


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            _buildSectionTitle('Información personal'),
            _buildMenuItem('Datos personales', Icons.person_outline),
            _buildSectionTitle('Configuración'),
            _buildMenuItem('Cuentas', Icons.account_balance, isNew: true),
            _buildSectionTitle('Experiencia en el app'),
            _buildMenuItem('Nuevas funcionalidades', Icons.new_releases),
            _buildMenuItem('Calificanos', Icons.star_border),
            _buildMenuItem('Envíanos tu opinión', Icons.feedback),
            _buildMenuItem('Términos y condiciones', Icons.description),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: 3,
        onTap: (index) {
          if (index != 3) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen())
            );
          }
          // Implementar la lógica de navegación aquí
          print('Tapped on index $index');
        },
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.grey,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.primary,
            child: Text(
              'P',
              style: TextStyle(fontSize: 36, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'PAUL',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Última conexión: 20 ene. 2025 | 18:59',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, {bool isNew = false}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isNew)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'NUEVO',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
      onTap: () {
        // Implementar navegación a la pantalla correspondiente
      },
    );
  }
}