import 'package:estudos_flutter_bytebank/databese/dao/contact_dao.dart';
import 'package:estudos_flutter_bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountController = TextEditingController();

  final ContactDao _dao = ContactDao();

  static const String _newContact = 'New contact';
  static const String _fullName = 'Full name';
  static const String _accountNumber = 'Account Number';
  static const String _save = 'Save';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Center(
            child: Text(
              _newContact,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: _fullName,
              ),
              style:
                  TextStyle(fontSize: 16, color: Theme.of(context).accentColor),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _accountController,
                decoration: InputDecoration(
                  labelText: _accountNumber,
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 16, color: Theme.of(context).accentColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String name = _nameController.text;
                    final int accountNumber =
                        int.tryParse(_accountController.text);

                    final Contact newContact = Contact(0, name, accountNumber);
                    _dao.save(newContact).then((id) => Navigator.pop(context));
                  },
                  child: Text(
                    _save,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
