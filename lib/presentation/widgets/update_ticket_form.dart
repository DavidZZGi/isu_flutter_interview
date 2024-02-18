import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/models/ticket.dart';
import '../state_management/ticket_bloc/bloc/ticket_bloc.dart';

class UpdateTicketFormDialog extends StatefulWidget {
  final Ticket ticket; // Ticket que se va a actualizar

  const UpdateTicketFormDialog({Key? key, required this.ticket})
      : super(key: key);

  @override
  UpdateTicketFormDialogState createState() => UpdateTicketFormDialogState();
}

class UpdateTicketFormDialogState extends State<UpdateTicketFormDialog> {
  late TextEditingController _clientNameController;
  late TextEditingController _addressController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _clientNameController =
        TextEditingController(text: widget.ticket.clientName);
    _addressController = TextEditingController(text: widget.ticket.address);
    _selectedDate = widget.ticket.ticketDate;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Update Ticket',
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
                context.read<TicketBloc>().add(OnTicketUpdate(
                    ticket: Ticket(
                        id: widget.ticket.id,
                        clientName: _clientNameController.text,
                        address: _addressController.text,
                        ticketDate: _selectedDate)));
                context.read<TicketBloc>().add(OnLoadTickets());
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }
}
