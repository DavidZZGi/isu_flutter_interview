import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:isu_flutter_interview/data/models/ticket.dart';

class WorkTicketScreen extends StatelessWidget {
  final Ticket ticket;
  // ignore: prefer_const_constructors_in_immutables
  WorkTicketScreen({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'dashboard',
                child: const Text('Dashboard'),
                onTap: () => context.go('/dashboard'),
              ),
              PopupMenuItem(
                value: 'get_directions',
                child: const Text('Get Directions'),
                onTap: () => context.go('/getdirections', extra: ''),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/dashboard'); // Volver al DashboardScreen
          },
        ),
        title: const Text('Work Ticket',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'Customer Info:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Name: ${ticket.clientName}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                        'Scheduled For: ${DateFormat('dd-MM-yyyy').format(ticket.ticketDate)}'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('Phone Number: ${generateCanadianPhoneNumber()}'),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Address: ${ticket.address}'),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          context.go('/getdirections', extra: ticket.address);
                        },
                        child: const Text('Get Directions'),
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text('Notes:'),
              ),
              const SizedBox(
                height: 200,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Reason for Call:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement navigation to other screens (overview, work details, purchasing, finishing up)
                        },
                        child: const Text(
                          'Overview',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement navigation to other screens (overview, work details, purchasing, finishing up)
                        },
                        child: const Text('Work Details',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement navigation to other screens (overview, work details, purchasing, finishing up)
                        },
                        child: const Text('Purchasing',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement navigation to other screens (overview, work details, purchasing, finishing up)
                        },
                        child: const Text('Finishing Up',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              // Add buttons for other sections as needed
            ],
          ),
        ),
      ),
    );
  }

  String generateCanadianPhoneNumber() {
    final Random random = Random();
    final String areaCode = _generateAreaCode(random);
    final String exchangeCode = _generateExchangeCode(random);
    final String subscriberNumber = _generateSubscriberNumber(random);

    return '($areaCode) $exchangeCode-$subscriberNumber';
  }

  String _generateAreaCode(Random random) {
    const int areaCodeMin = 201; // Rango de códigos de área en Canadá
    const int areaCodeMax = 999;
    final int areaCode =
        areaCodeMin + random.nextInt(areaCodeMax - areaCodeMin + 1);
    return areaCode.toString();
  }

  String _generateExchangeCode(Random random) {
    final int exchangeCode =
        random.nextInt(800 - 200) + 200; // Rango de códigos de intercambio
    return exchangeCode.toString().padLeft(3, '0');
  }

  String _generateSubscriberNumber(Random random) {
    final int subscriberNumber =
        random.nextInt(9999); // Número de suscriptor de 4 dígitos
    return subscriberNumber.toString().padLeft(4, '0');
  }
}
