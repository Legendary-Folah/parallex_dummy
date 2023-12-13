import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Transaction {
  String? id;
  String? description;
  double? amount;
  DateTime? date;
  DateFormat? time;
  String? productName;
  String? phoneNumber;
  String? title;
  int? accountDebited;


  Transaction({
    this.id,
    this.description,
    this.amount,
    this.date,
    this.time,
    this.productName,
    this.phoneNumber,
    this.title,
    this.accountDebited,
  });
}



