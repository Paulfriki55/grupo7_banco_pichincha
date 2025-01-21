import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../utils/constants.dart';
import 'confirmation_screen.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferir'),
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
            _buildBeneficiaryInfo(),
            const SizedBox(height: 24),
            _buildAmountInput(),
            const SizedBox(height: 24),
            _buildSourceAccount(),
            const SizedBox(height: 24),
            _buildTransferInfo(),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Continuar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ConfirmationScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBeneficiaryInfo() {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.secondary,
          child: const Text('S'),
        ),
        title: const Text('Sanchez Penafiel Paul Antonio'),
        subtitle: const Text('2212614088 | AHO4088\nBanco Pichincha'),
        trailing: const Icon(Icons.edit),
      ),
    );
  }

  Widget _buildAmountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Monto a transferir',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixText: '\$ ',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }

  Widget _buildSourceAccount() {
    return Card(
      child: ListTile(
        title: const Text('Desde'),
        subtitle: const Text('CA2\nNro. 2204474829'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('\$0.00'),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTransferInfo() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Esta transferencia no tiene costo'),
            Icon(Icons.info_outline, color: AppColors.primary),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          '+ Agregar motivo',
          style: TextStyle(color: AppColors.primary),
        ),
      ],
    );
  }
}