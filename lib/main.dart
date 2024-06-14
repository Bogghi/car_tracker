import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final AppDB db = AppDB();
  final TextEditingController controller = TextEditingController();

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
                                  controller: controller,
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
                                        onPressed: () async {
                                          await db.addRow(controller.text);
                                          await db.getAll();
                                        },
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

class AppDB {
  late Database db;

  AppDB(){
    _initDB();
  }

  _initDB() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, 'demo.db');

    await deleteDatabase(path);

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE Test(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT)");
      },
    );

    db.close();
  }

  addRow(String text) async {
    db = await openDatabase('demo.db');

    await db.transaction((txt) async {
      await txt.rawInsert("INSERT INTO Test(name) VALUES (?)", [text]);
    });

    db.close();
  }
  getAll() async {
    db = await openDatabase('demo.db');

    await db.transaction((txt) async {
      var list = await txt.rawQuery("SELECT * FROM Test");
      print(list);
    });

    db.close();
  }
}