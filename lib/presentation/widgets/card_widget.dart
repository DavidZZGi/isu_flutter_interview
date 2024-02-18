import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  final Widget child;
  const CardBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      color: Colors.blue,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
      child: child,
    );
  }
}
