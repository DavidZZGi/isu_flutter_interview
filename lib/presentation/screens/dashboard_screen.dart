import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:isu_flutter_interview/presentation/state_management/ticket_bloc/bloc/ticket_bloc.dart';
import 'package:isu_flutter_interview/presentation/widgets/card_widget.dart';
import 'package:isu_flutter_interview/presentation/widgets/ticket_form.dart';
import 'package:intl/intl.dart';
import '../widgets/calendar_widget.dart';
import '../widgets/update_ticket_form.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Row(
            children: [
              Flexible(
                child: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () {
                    _showCalendarDialog(context);
                    // Open calendar screen
                  },
                ),
              ),
              Flexible(
                child: IconButton(
                  icon: const Icon(Icons.sync),
                  onPressed: () {
                    // Sync calendar with Google Calendar
                  },
                ),
              )
            ],
          ),
          backgroundColor: Colors.blue,
          title: const Text('Dashboard'),
          actions: [
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const TicketFormDialog());
              },
              label: const Text('New Ticket'),
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'work_ticket',
                  child: Text('Work Ticket'),
                ),
                const PopupMenuItem(
                  value: 'get_directions',
                  child: Text('Get Directions'),
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
          ]),
      body: BlocBuilder<TicketBloc, TicketState>(
        builder: (context, state) {
          if (state is InitialTicketState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadTicketState) {
            if (state.tickets.isNotEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // List of tickets
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.tickets.length,
                      itemBuilder: (context, index) {
                        return CardBody(
                          child: ListTile(
                            title: Text(state.tickets[index].clientName),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.tickets[index].address),
                                Text(DateFormat('dd-MM-yyyy')
                                    .format(state.tickets[index].ticketDate)),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: IconButton(
                                      onPressed: () {
                                        context.read<TicketBloc>().add(
                                            OnTicketDelete(
                                                id: state.tickets[index].id!));
                                        context
                                            .read<TicketBloc>()
                                            .add(OnLoadTickets());
                                      },
                                      icon: const Icon(Icons.delete)),
                                ),
                                Flexible(
                                  child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return UpdateTicketFormDialog(
                                                ticket: state.tickets[index],
                                              );
                                            });
                                      },
                                      icon: const Icon(Icons.update)),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    context.go('/workticket');
                                  },
                                  child: const Text('View Ticket'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          } else if (state is ErrorTicketState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  void _showCalendarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Calendar"),
          content:
              const CalendarScreen(), // Include the CalendarScreen widget as the content of the dialog
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
