import 'package:flutter/material.dart';

class ConsoleTable extends StatefulWidget {
  final List<Map<String,dynamic>> dataSet;

  const ConsoleTable({
    super.key,
    required this.dataSet
  });

  @override
  State<ConsoleTable> createState() => _ConsoleTableState();
}

class _ConsoleTableState extends State<ConsoleTable> {
  final List<TableRow> rows = [];

  @override
  Widget build(BuildContext context) {
    widget.dataSet.forEach((data){
      final List<TableCell> cells = [];
      data.forEach((key, value){
        cells.add(TableCell(child: Text("$value")));
      });
      rows.add(TableRow(children: cells));
    });

    print(rows);
    return Table(
      border: TableBorder.all(),
      children: rows,
    );
  }
}
