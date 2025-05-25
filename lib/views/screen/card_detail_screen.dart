import 'package:flutter/material.dart';

class CardDetailScreen extends StatelessWidget {
  final String serviceName;

  const CardDetailScreen({Key? key, required this.serviceName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18171c),
      appBar: AppBar(
        title: const Text(
          'Card Detail',
          style: TextStyle(fontFamily: 'Syne'),
        ),
      ),
      body: Center(
        child: Text(
          'You tapped on: $serviceName',
          style: const TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Syne'),
        ),
      ),
    );
  }
}
