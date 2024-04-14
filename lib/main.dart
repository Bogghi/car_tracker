import 'package:flutter/material.dart';

import 'package:car_tracker/widgets/app_bar.dart';
import 'package:car_tracker/widgets/custom_btn.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(),
        body: Container(
          color: Colors.black,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Text(""),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 90,
          elevation: 0,
          color: Colors.black87,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomBtn(
                child:
                const Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                ),
                callback: (){}
              )
            ],
          ),
        ),
      ),
    );
  }
}