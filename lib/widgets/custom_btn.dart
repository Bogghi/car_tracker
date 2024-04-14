import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final Widget child;
  final void Function() callback;

  const CustomBtn({
    super.key,
    required this.child,
    required this.callback
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0
      ),
      child: child,
    );
  }
}
