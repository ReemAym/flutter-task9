import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:flutter/material.dart';

class NoResult extends StatelessWidget {
  const NoResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.sentiment_dissatisfied,
            size: 80,
            color: Colors.tealAccent[
                200], // Light teal color to contrast the dark background
          ),
          const SizedBox(height: 20), // Add space between icon and text
          const Text(
            'No results found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white, // White text for good contrast
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Try adjusting your search criteria.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[400], // Light grey for subtler message
            ),
          ),
        ],
      ),
    );
  }
}
