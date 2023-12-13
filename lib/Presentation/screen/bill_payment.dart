import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parallex_dummy/Data/models/transaction_model.dart';
import 'package:parallex_dummy/Data/remote/mock_data.dart';
import 'package:parallex_dummy/Presentation/screen/transaction_details_page.dart';
import 'package:parallex_dummy/constants.dart';

class BillPayPage extends StatelessWidget {
  BillPayPage({super.key, required this.icon});

  final ImageIcon icon;
  final List<Transaction> transactions = getMockTransactions();

  @override
  Widget build(BuildContext context) {
    Map<String, List<Transaction>> groupedTransactions = {};
    for (Transaction transaction in transactions) {
      String monthYear;
      monthYear = "${transaction.date?.month}-${transaction.date?.year}";

      if (groupedTransactions.containsKey(monthYear)) {
        groupedTransactions[monthYear]!.add(transaction);
      } else {
        groupedTransactions[monthYear] = [transaction];
      }
    }
    return SizedBox(
      child: ListView.builder(
        reverse: true,
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        itemCount: groupedTransactions.length,
        itemBuilder: (context, index) {
          String monthYear = groupedTransactions.keys.elementAt(index);
          String formatTimeWithoutAMPM(DateTime formattedTime) {
            return DateFormat('HH:mm').format(formattedTime);
          }
          String formattedTime =
              formatTimeWithoutAMPM(DateTime.now()).toString();
          String formattedData = DateFormat("MMMM").format(
            DateTime(
              int.parse(monthYear.split("-")[1]),
              int.parse(monthYear.split("-").first),
            ),
          );
          List<Transaction> monthTransactions = groupedTransactions[monthYear]!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 8, bottom: 8),
                child: Text(
                  formattedData,
                  style: const TextStyle(
                    fontSize: 16,
                    color: kInactiveTabColor,
                  ),
                ),
              ),
              ListView.builder(
                reverse: true,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: monthTransactions.length,
                itemBuilder: (context, index) {
                  // Get the current transaction for the inner list
                  Transaction transaction = monthTransactions[index];
                  String formattedDiffDate = DateFormat('dd/MM/yyyy')
                      .format(transaction.date as DateTime);
                  String formattedAmount = NumberFormat('#,##0.00', 'en_US').format(transaction.amount);
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionDetails(
                              date: transaction.date,
                              amount: transaction.amount,
                              productName: transaction.productName,
                              phoneNumber: transaction.phoneNumber,
                              accountDebited: transaction.accountDebited,
                            ),
                          ),
                        );
                      },
                      leading: icon,
                      title: Align(
                        alignment: const Alignment(-1.2, 0),
                        child: Text(transaction.description!),
                      ),
                      subtitle: Align(
                        alignment: const Alignment(-1.2, 0),
                        child: Text('$formattedTime, $formattedDiffDate'),
                      ),
                      trailing: Text(
                        '-₦$formattedAmount',
                        style: const TextStyle(
                          color: kDebitAlert,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      titleAlignment: ListTileTitleAlignment.center,
                    ),
                  );
                },
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}








// class Reusable_bills_history extends StatelessWidget {
//   const Reusable_bills_history({
//     super.key,
//     required this.monthYear,
//     required this.monthTransactions,
//     required this.title,
//   });
//
//   final String monthYear;
//   final List<Transaction> monthTransactions;
//   final Text title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             monthYear,
//             style: const TextStyle(fontSize: 15, color: kInactiveTabColor),
//           ),
//           ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: monthTransactions.length,
//             itemBuilder: (context, index) {
//               // Get the current transaction for the inner list
//               Transaction transaction = monthTransactions[index];
//               String formattedTime =
//                   DateFormat('hh:mm').format(transaction.date);
//               String formattedDate =
//                   DateFormat('dd/MM/yy').format(transaction.date);
//               // Display the transaction details using a ListTile
//               return ListTile(
//                 leading: const Icon(Icons.mobile_friendly),
//                 title: title,
//                 subtitle: Text('$formattedTime, $formattedDate'),
//                 trailing: const Text(
//                   '-₦${20},000.00',
//                   style: TextStyle(
//                     color: Colors.red,
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 // You can add more details or customize the ListTile as needed
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
