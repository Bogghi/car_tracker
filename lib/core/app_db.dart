import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDB {
  late Database db;

  AppDB(){
    _initDB();
  }

  _initDB() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, 'demo.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE transactions("
            "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "
            "value integer not null default 0,"
            "account integer not null"
          ")"
        );
      },
    );

    await db.transaction((txt) async {
      await txt.rawInsert("insert into transactions(value, account) values (?, ?)", [10, "buddybank"]);
    });

    await db.transaction((txt) async {
      var list = await txt.rawQuery("select * from transactions");
      print(list);
    });

    db.close();
  }

  dynamic transaction(String query) async {
    db = await openDatabase(join(await getDatabasesPath(), 'demo.db'));
    

    var list;

    await db.transaction((txt) async {
      list = await txt.rawQuery(query);
    });

    return list;
  }
}