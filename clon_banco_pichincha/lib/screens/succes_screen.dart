import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../utils/constants.dart';
import 'home_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/WhatsApp%20Image%202025-01-20%20at%2020.58.46_63d0c12d.jpg-OG3MSvqkw7bx31i2uYWnvPUUa4dChj.jpeg',
          height: 30,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            const SizedBox(height: 24),
            const Text(
              '¡Transferencia exitosa!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Comprobante: 170528143',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 32),
            _buildTransactionDetails(),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Compartir comprobante',
              onPressed: () {
                // Implementar lógica para compartir comprobante
              },
            ),
            const SizedBox(height: 16),
            _buildRatingButton(),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (route) => false,
                );
              },
              child: const Text('Otras operaciones'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDetailItem('Monto', '\$0.10'),
            _buildDetailItem('Costo de transacción', '\$0.00'),
            _buildDetailItem('Fecha', '20 ene 2025'),
            const Divider(),
            _buildDetailItem('Cuenta origen', 'Sanchez Penafiel Pau...'),
            _buildDetailItem('Número de cuenta', '******4088'),
            const Divider(),
            _buildDetailItem('Cuenta destino', 'Sanchez Penafiel Pau...'),
            _buildDetailItem('Número de cuenta', '******4829'),
            _buildDetailItem('Banco', 'Banco Pichincha'),
            _buildDetailItem('Correo electrónico', 'No registrado'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRatingButton() {
    return OutlinedButton.icon(
      onPressed: () {
        // Implementar lógica para calificar experiencia
      },
      icon: const Icon(Icons.star, color: Colors.amber),
      label: const Text('Calificar experiencia'),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.primary),
        foregroundColor: AppColors.primary,
      ),
    );
  }
}