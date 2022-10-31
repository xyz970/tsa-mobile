import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common/utils/utils.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  sqfliteFfiInit();
  var factory = databaseFactoryFfi;
  var localDbPath = join('.dart_tool', 'sqflite_exp', 'test', 'databases');
  var dbName = 'simple.db';
  await factory.setDatabasesPath(localDbPath);
  print('Databases path: ${await factory.getDatabasesPath()}');
  // await factory.debugSetLogLevel(sqfliteLogLevelVerbose);
  int? newValue;

  var db = await factory.openDatabase(dbName,
      options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, version) async {
            await db.execute(
                'CREATE TABLE IF NOT EXISTS my_table (id INTEGER PRIMARY KEY, value INTEGER)');
          }));

  await db.transaction((txn) async {
    var existing = firstIntValue(
            await txn.query('my_table', columns: ['value'], where: 'id = 1')) ??
        0;
    newValue = existing + 1;
    var updated = await txn.update('my_table', {'value': newValue});
    if (updated == 0) {
      await txn.insert('my_table', {'value': newValue, 'id': 1});
    }
  });

  print(
      'updated to $newValue (re-run and it should increment again - $dbName)');
  await db.close();
}