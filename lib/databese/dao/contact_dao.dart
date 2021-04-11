import 'package:estudos_flutter_bytebank/models/contact.dart';
import 'package:sqflite/sqlite_api.dart';

import '../app_databese.dart';

class ContactDao {
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _tableName = 'contacts';
  static const String _accountNumber = 'account_number';

  static const String tablesql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  Future<int> save(Contact contact) async {
    final Database db = await getDataBase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> results = await db.query(_tableName);
    List<Contact> contacts = _toList(results);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> results) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in results) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}

Map<String, dynamic> _toMap(Contact contact) {
  final Map<String, dynamic> contactMap = Map();
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.accountNumber;
  return contactMap;
}
