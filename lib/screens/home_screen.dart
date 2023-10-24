import 'package:flutter/material.dart';

import '../models/stock_model.dart';
import '../widgets/stock_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Stock> stocks = [
    Stock(name: 'Nifty 50', symbol: 'A', price: 100.00, percentage: -1.34, logoUrl: 'https://s3-symbol-logo.tradingview.com/indices/nifty-50--600.png'),
    Stock(name: 'Sensex', symbol: 'B', price: 150.00, percentage: 1.34, logoUrl: 'https://s3-symbol-logo.tradingview.com/indices/bse-sensex--600.png'),
    Stock(name: 'Nasdaq', symbol: 'C', price: 75.00, percentage: 0.30, logoUrl: 'https://www.nasdaq.com/sites/acquia.prod/files/styles/355x355/public/2020/09/24/nasdaq.jpg'),
  ];

  late List<Stock> displayedStocks;

  @override
  void initState() {
    super.initState();
    displayedStocks = List.from(stocks);
  }

  void _filterStocks(String query) {
    setState(() {
      displayedStocks = stocks
          .where((stock) =>
      stock.name.toLowerCase().contains(query.toLowerCase()) ||
          stock.symbol.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: 70,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search stocks...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey, // Color of the search icon
                ),
                filled: true,
                fillColor: Colors.grey[100], // Background color of the search box
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), // Adjust the border radius as needed
                  borderSide: BorderSide.none, // Remove the default border
                ),
                contentPadding: const EdgeInsets.all(16.0), // Adjust the padding as needed
              ),
              onChanged: (query) => _filterStocks(query),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: displayedStocks.length,
                itemBuilder: (context, index) {
                  final stock = displayedStocks[index];
                  return StockCard(
                    logoImageUrl: stock.logoUrl,
                    name: stock.name,
                    price: stock.price,
                    percentage: stock.percentage,
                    onSubscribe: () {
                      // Implement the subscription logic for the stock
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
