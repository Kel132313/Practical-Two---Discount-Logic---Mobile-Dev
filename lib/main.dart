import 'package:flutter/material.dart';
import 'discount_logic.dart';

void main() {
  runApp(const NorthStar());
}

class NorthStar extends StatefulWidget {
  const NorthStar({super.key});

  @override
  State<NorthStar> createState() => _NorthStarState();
}

class _NorthStarState extends State<NorthStar> {
  // Controllers to read input from text fields
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  String _result = '';

  // Instance of the logic module
  final DiscountLogic _logic = DiscountLogic();

  @override
  void dispose() {
    _priceController.dispose();
    _discountController.dispose();
    super.dispose();
  }

  void _calculateDiscount() {
    try {
      double price = double.parse(_priceController.text);
      double discount = double.parse(_discountController.text);

      double finalPrice = _logic.calculate(price, discount);

      setState(() {
        _result = 'Final Price: \$${finalPrice.toStringAsFixed(2)}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discount Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Discount Calculator',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 90, 32, 32),
            ),
          ),
          backgroundColor: Colors.amberAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter original price',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                  prefixText: '\$ ',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _discountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter discount percentage',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                  suffixText: '%',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateDiscount,
                child: const Text('Calculate Discount'),
              ),
              const SizedBox(height: 30),
              Text(
                _result,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
