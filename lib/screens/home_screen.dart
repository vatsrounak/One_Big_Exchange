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
    Stock(name: 'New York Stock Exchange', symbol: 'NYSE', price: 100.00, percentage: -1.34, logoUrl: 'https://logodownload.org/wp-content/uploads/2019/07/nyse-logo-0.png'),
    Stock(name: 'National Association of Securities Dealers Automated Quotations', symbol: 'NASDAQ', price: 150.00, percentage: 1.34, logoUrl: 'https://i.pinimg.com/originals/1f/31/94/1f31948775d68f34474cad7a7eba0ed4.png'),
    Stock(name: 'Boston Stock Exchange', symbol: 'BSE', price: 75.00, percentage: 0.30, logoUrl: 'https://s3-symbol-logo.tradingview.com/boston-scientific--600.png'),
    Stock(name: 'Chicago Options Exchange', symbol: 'CBOE', price: 75.00, percentage: 0.30, logoUrl: 'https://www.financemagnates.com/wp-content/uploads/fxmag/2014/03/CBOE-logo.png'),
    Stock(name: 'Chicago Board of Trade', symbol: 'CBOT', price: 75.00, percentage: 0.30, logoUrl: 'https://i.redd.it/9mn6unukjd911.png'),
    Stock(name: 'Chicago Mercantile Exchange', symbol: 'CME', price: 75.00, percentage: 0.30, logoUrl: 'https://www.ampfutures.com/hubfs/CME_Group-Logo.png'),
    Stock(name: 'International Securities Exchange', symbol: 'ISE', price: 75.00, percentage: 0.30, logoUrl: 'https://www.weareguernsey.com/media/4178/tise.jpg'),
    Stock(name: 'National Stock Exchange', symbol: 'NSX', price: 75.00, percentage: 0.30, logoUrl: 'https://logowik.com/content/uploads/images/nse-national-stock-exchange-of-india5651.jpg'),
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
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: displayedStocks.length,
                itemBuilder: (context, index) {
                  final stock = displayedStocks[index];
                  return StockCard(
                    logoImageUrl: stock.logoUrl,
                    symbol: stock.symbol,
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
