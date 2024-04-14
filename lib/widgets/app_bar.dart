import 'package:flutter/material.dart';

import 'package:car_tracker/widgets/custom_btn.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _MyAppBarState extends State<MyAppBar> {
  bool editMode = false;
  String vehicleName = "Car";
  List<Widget> actions = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: getTitle(),
      centerTitle: true,
      actions: actions,
    );
  }

  Widget getTitle() {
    if (!editMode) {
      return InkWell(
        onTap: _showEditInterface,
        child: Text(
          vehicleName,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }

    return TextField(
      decoration: const InputDecoration(labelText: "Nome veicolo", labelStyle: TextStyle(color: Colors.white)),
      cursorColor: Colors.white,
      autofocus: true,
      style: const TextStyle(color: Colors.white),
      controller: controller,
    );
  }

  void _setNewName() {
    setState(() {
      vehicleName = controller.value.text;
      editMode = false;
      actions = [];
    });
  }

  void _showEditInterface() {
    setState(() {
      editMode = true;
      actions = [
        CustomBtn(
          callback: _setNewName,
          child: const Icon(
            Icons.save_rounded,
            color: Colors.white,
          )
        )
      ];
    });
  }
}
