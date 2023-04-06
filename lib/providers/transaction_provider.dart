import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/database/transaction_db.dart';
import 'package:flutter_application_1/model/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [
    // Transaction(title: "กระเป๋า", amount: 100, date: DateTime.now()),
    // Transaction(title: "เสื้อ", amount: 200, date: DateTime.now()),
    // Transaction(title: "กางเกง", amount: 300, date: DateTime.now()),
  ];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    await db.insertData(statement);

    transactions = await db.loadAllData();
    notifyListeners();
  }

  void initData() async {
    var db = TransactionDB(dbName: "transactions.db");
    transactions = await db.loadAllData();
    notifyListeners();
  }
}
