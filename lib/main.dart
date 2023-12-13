import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parallex_dummy/Presentation/screen/transaction_details_page.dart';
import 'package:parallex_dummy/home.dart';
import 'package:parallex_dummy/Data/models/transaction_model.dart';
import 'package:parallex_dummy/Data/remote/mock_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key, this.money});

  final List<Transaction> transactions = getMockTransactions();
  final double? money;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => const BillsPayment(),
        '/second' : (context) => TransactionDetails(),
      },
    );
  }
}
