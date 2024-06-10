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
              NavigationRail(destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: Text('First'),
                ),
                NavigationRailDestination(
                  icon: Badge(child: Icon(Icons.bookmark_border)),
                  selectedIcon: Badge(child: Icon(Icons.book)),
                  label: Text('Second'),
                ),
                NavigationRailDestination(
                  icon: Badge(
                    label: Text('4'),
                    child: Icon(Icons.star_border),
                  ),
                  selectedIcon: Badge(
                    label: Text('4'),
                    child: Icon(Icons.star),
                  ),
                  label: Text('Third'),
                ),
              ], selectedIndex: 0, minWidth: 60,),
              VerticalDivider(),
              Expanded(
                child: Center(
                  child: Text("I'm at the center"),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}