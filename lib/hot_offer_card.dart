import 'package:flutter/material.dart';


class HotOfferCard extends StatelessWidget {
  final String image;
  final String description;

  const HotOfferCard({
    super.key,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: screenWidth * 0.2, // example: 20% of screen width
              height: screenWidth * 0.2,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Suwannaphum',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
