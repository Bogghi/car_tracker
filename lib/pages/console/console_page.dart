import 'package:flutter/material.dart';
import 'package:personal_finance/components/console/console_table.dart';
import 'package:personal_finance/core/app_db.dart';



class ConsolePage extends StatefulWidget {
  const ConsolePage({super.key});

  @override
  State<ConsolePage> createState() => _ConsolePageState();
}

class _ConsolePageState extends State<ConsolePage> {
  final AppDB db = AppDB();

  List<Map<String, dynamic>> dataSet = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TextField(
            textAlign: TextAlign.center,
            onSubmitted: (text) async {
              var list = await db.transaction(text);
              setState(() {
                print("sto cazzo");
                dataSet = list;
              });
            },
          ),
          ConsoleTable(dataSet: dataSet)
        ],
      )
    );
  }
}
