import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:car_tracker/widgets/app_bar.dart';
import 'package:car_tracker/widgets/custom_btn.dart';

import 'package:car_tracker/repository/data_repository.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              NavigationRail(
                selectedIndex: 0,
                destinations: const [
                   NavigationRailDestination(
                    icon: Icon(Icons.home_rounded),
                    selectedIcon: Icon(Icons.home_rounded),
                    label: Text('Home Page'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.add_box_outlined),
                    selectedIcon: Badge(child: Icon(Icons.add_box_rounded)),
                    label: Text('Second'),
                  ),
                ],
              ),
              const VerticalDivider(),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: 500,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade600.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text("10"),
                                      Icon(Icons.euro),
                                    ],
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: Text("Hello"),
                                  flex: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}