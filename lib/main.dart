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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    icon: Icon(Icons.settings_outlined),
                    selectedIcon: Badge(child: Icon(Icons.settings_rounded)),
                    label: Text('Second'),
                  ),
                ],
              ),
              const VerticalDivider(),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Nuova transazione", style: TextStyle(color: Colors.deepPurple)),
                            const SizedBox(height: 10,),
                            Container(
                              width: 500,
                              child: Material(
                                elevation: 4.0,
                                borderRadius: BorderRadius.circular(20.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      borderSide: BorderSide.none,
                                    ),
                                    fillColor: Colors.deepPurple.shade100.withOpacity(0.5),
                                    filled: true,
                                    hintText: "10 euro buddybank servizi",
                                    hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(0.5)
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: TextButton(
                                        onPressed: (){},
                                        style: TextButton.styleFrom(
                                          elevation: 0.0,
                                          backgroundColor: Colors.transparent,
                                        ),
                                        child: const Icon(Icons.add_rounded)
                                      ),
                                    )
                                  ),
                                ),
                              )
                            ),
                            const SizedBox(height: 10,),
                            Container(
                              width: 500,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.shade600.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child:  Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("10"),
                                          Icon(Icons.euro),
                                        ],
                                      ),
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
                        ),
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