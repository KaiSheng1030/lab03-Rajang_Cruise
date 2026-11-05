import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String name;
  final String location;
  final int ratingCount;
  final VoidCallback onIncrementRating;

  const TitleSectionWidget({
    super.key,
    required this.name,
    required this.location,
    required this.ratingCount,
    required this.onIncrementRating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 24),
              const SizedBox(width: 4),
              Text(
                '$ratingCount',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              IconButton(
                icon: const Icon(Icons.thumb_up_outlined, color: Colors.blue),
                onPressed: onIncrementRating,
                tooltip: 'Like / Rate',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
