import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkTicketScreen extends StatelessWidget {
  const WorkTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/dashboard'); // Volver al DashboardScreen
          },
        ),
        title: Text('Work Ticket'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Customer Info:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Name: Exmaple'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Phone Number: Exmaple'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Address: Exmaple'),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement navigation to Get Directions screen
                      },
                      child: Text('Get Directions'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Scheduled For: ${DateTime.now.toString()}'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Notes:'),
            ),
            const SizedBox(
              height: 300,
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
    );
  }
}
