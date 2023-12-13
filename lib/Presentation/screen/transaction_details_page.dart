import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parallex_dummy/constants.dart';

import '../widgets/reusable_parallex_text_button.dart';
import '../widgets/reusable_row.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({
    super.key,
    this.amount,
    this.date,
    this.productName,
    this.phoneNumber,
    this.accountDebited,
    this.title,
  });

  final double? amount;
  final DateTime? date;
  final String? productName;
  final String? phoneNumber;
  final int? accountDebited;
  final String? title;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    String formattedAmountHere =
        NumberFormat('#,##0.00', 'en_US').format(amount);
    return Scaffold(
      backgroundColor: kBGColor,
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.all(10),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kHeaderColor,
          ),
        ),
        elevation: 0,
        backgroundColor: kBGColor,
        title: const Text(
          'Airtime',
          style: TextStyle(
            color: kActiveTabColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              Text(
                // String formattedAmount = NumberFormat('#,##0.00', 'en_US').format(transaction.amount);
                '₦$formattedAmountHere',
                // '₦$amount',
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 40,
                ),
                child: Container(
                  child: Column(
                    children: [
                      ReusableRow(
                        text: 'Amount',
                        text2: '₦$formattedAmountHere',
                      ),
                      const SizedBox(height: 20),
                      ReusableRow(
                        text: 'Product Name',
                        text2: productName!,
                      ),
                      const SizedBox(height: 20),
                      ReusableRow(
                        text: 'Phone Number',
                        text2: phoneNumber!,
                      ),
                      const SizedBox(height: 20),
                      ReusableRow(
                        text: 'Account Debited',
                        text2: accountDebited!.toString(),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 20),
                      const ReusableRow(text: 'Frequency', text2: 'Monthly'),
                      const SizedBox(height: 20),
                      ReusableRow(text: 'Start Date', text2: formattedDate),
                      const SizedBox(height: 20),
                      ReusableRow(text: 'End Date', text2: formattedDate),
                      const SizedBox(
                        height: 60,
                      ),
                      ParallexTextButton(
                        onPressed: () {
                          print('Button Clicked - Authorize');
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(kActiveTabColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        child: const Text(
                          'Authorize',
                          style: TextStyle(fontSize: 15, color: kBGColor),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ParallexTextButton(
                        onPressed: () {
                          print('Button Clicked - Decline');
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(kBGColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              side: const BorderSide(color: kActiveTabColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Decline',
                          style: TextStyle(
                            fontSize: 15,
                            color: kActiveTabColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
