import 'package:estudos_flutter_bytebank/databese/dao/contact_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDataBase() async {
  final String path = join(
    await getDatabasesPath(),
    'bytebank.db',
  );
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tablesql);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete //para limpar a base do Sqlife
  );
}
