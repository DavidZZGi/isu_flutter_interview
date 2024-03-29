import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isu_flutter_interview/data/models/ticket.dart';
import 'package:isu_flutter_interview/presentation/state_management/ticket_bloc/bloc/ticket_bloc.dart';

class TicketFormDialog extends StatefulWidget {
  const TicketFormDialog({Key? key}) : super(key: key);

  @override
  TicketFormDialogState createState() => TicketFormDialogState();
}

class TicketFormDialogState extends State<TicketFormDialog> {
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
              decoration: const InputDecoration(labelText: 'Client Name'),
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<TicketBloc>().add(OnTicketCreate(
                    ticket: Ticket(
                        clientName: _clientNameController.text,
                        address: _addressController.text,
                        ticketDate: _selectedDate)));
                //load the ticket again after insertion
                //can be improved for not making unneccessary requests
                context.read<TicketBloc>().add(OnLoadTickets());
                Navigator.of(context).pop();
              },
              child: const Text('Create'),
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
