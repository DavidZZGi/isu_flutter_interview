import 'package:flutter/material.dart';

class TicketFormDialog extends StatefulWidget {
  const TicketFormDialog({Key? key}) : super(key: key);

  @override
  _TicketFormDialogState createState() => _TicketFormDialogState();
}

class _TicketFormDialogState extends State<TicketFormDialog> {
  final TextEditingController _clientNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  late DateTime _selectedDate; // Variable para almacenar la fecha seleccionada

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now(); // Inicializar con la fecha actual
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Create Ticket',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: _clientNameController,
              decoration: InputDecoration(labelText: 'Client Name'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: Text(
                    'Select Date: ${_formatDate(_selectedDate)}',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // _createTicket(context);
              },
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }

  // Función para seleccionar la fecha a través de un calendario
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate; // Actualizar la fecha seleccionada
      });
    }
  }

  // Función para formatear la fecha en un formato legible
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
