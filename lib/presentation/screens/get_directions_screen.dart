import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetDirectionScreen extends StatefulWidget {
  final String? address;
  const GetDirectionScreen({
    this.address,
    Key? key,
  }) : super(key: key);

  @override
  GetDirectionScreenState createState() => GetDirectionScreenState();
}

class GetDirectionScreenState extends State<GetDirectionScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  final TextEditingController _addressController = TextEditingController();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _addressController.text = widget.address!;
  }

//I could not be able to get an api key for google map integration
//but basically giving address param to google map endpoint
// and the GoogleMap widget for drawing the ui, is good to go
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Directions'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/dashboard'); // go back to dashboard
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Enter Address',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  'Map Placeholder',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
