import 'package:flutter/material.dart';
import 'package:one_big_exchange/theme.dart';

class StockCard extends StatelessWidget {
  final String logoImageUrl;
  final String name;
  final double price;
  final double percentage;
  final VoidCallback onSubscribe;

  const StockCard({super.key,
    required this.logoImageUrl,
    required this.name,
    required this.price,
    required this.percentage,
    required this.onSubscribe,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPercentagePositive = percentage >= 0;
    final Color percentageColor = isPercentagePositive ? Colors.green : Colors.red;

    return Card(
      elevation: 0,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed
              child: Image.network(
                logoImageUrl,
                width: 70,
                height: 70,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}', // Display price
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${percentage.toStringAsFixed(2)}%',
                        style: TextStyle(
                          fontSize: 14,
                          color: percentageColor, // Set text color based on percentage
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Right side with subscribe button
          Padding(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              elevation: 0,
              color: myTheme.primaryColor,
              onPressed: onSubscribe,
              child: const Text('Subscribe'),
            ),
          ),
        ],
      ),
    );
  }
}
