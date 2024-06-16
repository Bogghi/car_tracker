import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  final int value;
  final String name;

  const Transaction({
    super.key,
    required this.value,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade600.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child:  Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(value.toString()),
                  const Icon(Icons.euro),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(name),
            ),
          ],
        ),
      ),
    );
  }
}
