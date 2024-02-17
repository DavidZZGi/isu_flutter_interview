import 'package:flutter/material.dart';
import 'package:isu_flutter_interview/data/models/ticket.dart';

import '../widgets/calendar_widget.dart';

class DashboardScreen extends StatelessWidget {
  // Dummy data for the list of tickets
  final List<Ticket> tickets = [
    Ticket(
        clientName: 'Client A',
        address: 'Address A',
        ticketDate: DateTime.now()),
    Ticket(
        clientName: 'Client B',
        address: 'Address B',
        ticketDate: DateTime.now()),
    // Add more tickets as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              _showCalendarDialog(context);
              // Open calendar screen
            },
          ),
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              // Sync calendar with Google Calendar
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('Work Ticket'),
                value: 'work_ticket',
              ),
              const PopupMenuItem(
                child: Text('Get Directions'),
                value: 'get_directions',
              ),
            ],
            onSelected: (value) {
              if (value == 'work_ticket') {
                // Navigate to work ticket screen
              } else if (value == 'get_directions') {
                // Navigate to get directions screen
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // List of tickets
          Expanded(
            child: ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tickets[index].clientName),
                  subtitle: Text(tickets[index].address),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Open work ticket screen for the selected ticket
                    },
                    child: const Text('View Ticket'),
                  ),
                );
              },
            ),
          ),
          // New ticket button
          ElevatedButton(
            onPressed: () {
              // Navigate to new ticket screen
            },
            child: const Text('New Ticket'),
          ),
        ],
      ),
    );
  }

  void _showCalendarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Calendar"),
          content:
              CalendarScreen(), // Include the CalendarScreen widget as the content of the dialog
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
