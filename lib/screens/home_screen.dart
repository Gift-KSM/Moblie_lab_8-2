import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/transaction.dart';
import '../providers/transaction_provider.dart';
import 'from_screen.dart';
import 'package:flutter_application_1/main.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แอปรายจ่าย"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormScreen();
                  }));
                },
                icon: Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ))
          ],
        ),
        body:
            Consumer(builder: ((context, TransactionProvider provider, child) {
          var count = provider.transactions.length;
          if (count <= 0) {
            return const Center(
                child: Text(
              "ไม่พบข้อมูล",
              style: TextStyle(fontSize: 35),
            ));
          } else {
            return ListView.builder(
                itemCount: provider.transactions.length,
                itemBuilder: (context, int index) {
                  Transactions data = provider.transactions[index];
                  return Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: FittedBox(
                          child: Text(data.amount.toString()),
                        ),
                      ),
                      title: Text(data.title),
                      subtitle: Text(
                          DateFormat("dd/MM/yyy HH:mm:ss").format(data.date)),
                    ),
                  );
                });
          }
        })));
  }
}
