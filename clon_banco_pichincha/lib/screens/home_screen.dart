import 'package:flutter/material.dart';
import '../components/account_card.dart';
import '../components/bottom_navigation.dart';
import '../models/account.dart';
import '../utils/constants.dart';
import 'transfer_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final Account _demoAccount = Account(
    id: 'CA2',
    type: 'Cuenta de Ahorros',
    number: '2204474829',
    balance: 10000.00,
    isFavorite: true,
    bank: 'Banco Pichincha',
  );

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/4/45/Banco_Pichincha_nuevo.png',
          height: 30,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline), // And this
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPromoBanner(),
            _buildProductsSection(),
            AccountCard(account: _demoAccount),
            _buildActionsGrid(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ]),
        child: Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Haz de todo sin ir al banco',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Descubre lo que puedes hacer desde tu Banca Móvil',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ]),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Descubrir opciones'),
            ),
          ],
        ));
  }

  Widget _buildProductsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Mis productos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Ver todos >',
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              _buildFilterChip('Todos', true),
              _buildFilterChip('Cuentas', false),
              _buildFilterChip('Tarjetas', false),
              _buildFilterChip('Préstamos', false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: FilterChip(
          label: Text(label),
          selected: isSelected,
          onSelected: (bool value) {},
          backgroundColor: Colors.white,
          selectedColor: AppColors.primary,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ));
  }

  Widget _buildActionsGrid() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '¿Qué quieres hacer?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildActionItem(
                'Transferir dinero',
                Icons.send,
                    () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TransferScreen()),
                ),
              ),
              _buildActionItem('Recibir dinero', Icons.account_balance_wallet,
                      () {}),
              _buildActionItem('Escanear QR', Icons.qr_code_scanner, () {}),
              _buildActionItem('Pagar servicios', Icons.payment, () {}),
              _buildActionItem('Recargar celular', Icons.phone_android, () {}),
              _buildActionItem('Más opciones', Icons.more_horiz, () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(
      String label, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}