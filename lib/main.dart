import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance/pages/console/console_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {

  App({super.key});

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
                    icon: Icon(Icons.terminal),
                    label: Text('Home Page'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings_outlined),
                    selectedIcon: Badge(child: Icon(Icons.settings_rounded)),
                    label: Text('Second'),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.zero,
                child: VerticalDivider(width: 1,),
              ),
              ConsolePage()
            ],
          ),
        ),
      ),
    );
  }
}