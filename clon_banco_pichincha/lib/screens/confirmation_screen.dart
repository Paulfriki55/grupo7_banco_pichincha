import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../utils/constants.dart';
import 'succes_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferencias'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Confirma los datos de la transferencia',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildConfirmationCard(),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Confirmar transferencia',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const SuccessScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmationCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildConfirmationItem('098802'),
            const Divider(),
            _buildConfirmationItem('Vas a transferir:', '\$0.10'),
            _buildConfirmationItem('De la cuenta:', 'AHO4088'),
            _buildConfirmationItem(
              'Beneficiario:',
              'Sanchez Penafiel Paul Antonio',
            ),
            _buildConfirmationItem('A la cuenta:', '2204474829'),
            _buildConfirmationItem('Banco destino:', 'Banco Pichincha'),
            _buildConfirmationItem('Correo electrónico:', 'No registrado'),
            const Divider(),
            _buildConfirmationItem(
              'Esta transacción no tiene costo',
              '',
              const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmationItem(String label, [String? value, TextStyle? textStyle]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          if (value != null) Text(value, style: textStyle),
        ],
      ),
    );
  }
}

