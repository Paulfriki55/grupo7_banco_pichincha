import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../utils/constants.dart';
import 'transfer_screen.dart';

class BeneficiaryScreen extends StatelessWidget {
  const BeneficiaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elige el beneficiario'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Escribe un nombre o cuenta',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSectionTitle('Mis cuentas'),
                _buildAccountItem('AHO4088', '2212614088 - Transaccional', 'A'),
                _buildAccountItem('CA2', '2204474829 - Transaccional', 'C'),
                _buildSectionTitle('Mis contactos'),
                _buildContactItem('Ariana Mikeyla Narvaez', '410060011621 - Aho', 'A'),
                _buildContactItem('Anahi Sanchez', '2205953907 - Aho', 'A'),
                _buildContactItem('Arboleda Melo Fernando Xavier', '2201309396 - Aho', 'A'),
                _buildContactItem('Arevalo Burgos Ana Lucrecia', '2201309397 - Aho', 'A'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Implementar lógica para agregar nuevo contacto
        },
        label: const Text('Nuevo contacto'),
        icon: const Icon(Icons.person_add),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAccountItem(String accountName, String accountDetails, String initial) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.secondary,
        child: Text(initial),
      ),
      title: Text(accountName),
      subtitle: Text(accountDetails),
      trailing: const Icon(Icons.more_vert),
      onTap: () {
        // Implementar lógica para seleccionar cuenta
      },
    );
  }

  Widget _buildContactItem(String name, String accountDetails, String initial) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Text(initial),
      ),
      title: Text(name),
      subtitle: Text(accountDetails),
      trailing: const Icon(Icons.more_vert),
      onTap: () {
        // Implementar lógica para seleccionar contacto
      },
    );
  }
}