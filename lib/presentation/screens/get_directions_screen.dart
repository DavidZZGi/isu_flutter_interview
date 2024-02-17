import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetDirectionScreen extends StatefulWidget {
  const GetDirectionScreen({
    Key? key,
  }) : super(key: key);

  @override
  _GetDirectionScreenState createState() => _GetDirectionScreenState();
}

class _GetDirectionScreenState extends State<GetDirectionScreen> {
  late GoogleMapController _controller;
  late TextEditingController _addressController;
  final String initialAddress = '11 entre e y f';
  //final ValueChanged<String> onAddressChanged=(){};

  @override
  void initState() {
    super.initState();
    //  _addressController = TextEditingController(text: widget.initialAddress);
  }

  @override
  void dispose() {
    _controller.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                  0, 0), // Initial position (change it according to your needs)
              zoom: 15, // Initial zoom level
            ),
            onMapCreated: (controller) {
              setState(() {
                _controller = controller;
              });
            },
            onCameraMove: (position) {
              // Get the address from the current camera position
              // (You might need to use a Geocoding API to get the address from the LatLng)
              // For simplicity, we're just setting the latitude and longitude as the address
              /* widget.onAddressChanged(
                  '${position.target.latitude}, ${position.target.longitude}');*/
            },
          ),
        ),
        TextField(
          controller: _addressController,
          decoration: InputDecoration(
            labelText: 'Address',
            hintText: 'Enter address for directions',
          ),
          onChanged: (address) {
            // Move the camera to the specified address when the user modifies it
            // (You might need to use a Geocoding API to get the LatLng from the address)
            // For simplicity, we're just parsing the address as LatLng
            List<String> parts = address.split(',');
            if (parts.length == 2) {
              double latitude = double.tryParse(parts[0]) ?? 0;
              double longitude = double.tryParse(parts[1]) ?? 0;
              _controller.animateCamera(
                  CameraUpdate.newLatLng(LatLng(latitude, longitude)));
            }
          },
        ),
      ],
    );
  }
}
