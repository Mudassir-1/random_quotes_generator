import 'package:flutter/material.dart';
import 'dart:math';
import 'package:share/share.dart';

void main() {
  runApp(RandomQuoteApp());
}

class RandomQuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomQuoteScreen(),
    );
  }
}

class RandomQuoteScreen extends StatefulWidget {
  @override
  _RandomQuoteScreenState createState() => _RandomQuoteScreenState();
}

class _RandomQuoteScreenState extends State<RandomQuoteScreen> {
  final List<String> _quotes = [
    "The only way to do great work is to love what you do. - Steve Jobs",
    "Success is not the key to happiness. Happiness is the key to success. - Albert Schweitzer",
    "Success usually comes to those who are too busy to be looking for it. - Henry David Thoreau",
    "Don’t watch the clock; do what it does. Keep going. - Sam Levenson",
    "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
    "The best time to plant a tree was 20 years ago. The second best time is now. - Chinese Proverb",
    "You miss 100% of the shots you don’t take. - Wayne Gretzky",
    "The harder you work for something, the greater you’ll feel when you achieve it.",
    "Don’t stop when you’re tired. Stop when you’re done.",
    "Dream bigger. Do bigger.",
  ];

  String _currentQuote = "Press the button to get a random quote.";
  int num  = 0;

  void _generateRandomQuote() {
    final random = Random();
    setState(() {
      _currentQuote = _quotes[random.nextInt(_quotes.length)];
    });
  }

  void _shareQuote() {
    Share.share(_currentQuote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Quotes'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _currentQuote,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _generateRandomQuote,
              child: Text('Generate Quote'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _shareQuote,
              icon: Icon(Icons.share),
              label: Text('Share Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
