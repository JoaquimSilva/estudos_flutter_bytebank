import 'package:estudos_flutter_bytebank/databese/dao/contact_dao.dart';
import 'package:estudos_flutter_bytebank/models/contact.dart';
import 'package:flutter/material.dart';

import 'contacts_form.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao dao = ContactDao();
  static const String _contacts = 'Contacts';
  static const String _waiting = 'Estamos carregando seus contatos....';
  static const String _error = 'Ops... Houston we having a problem';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Center(
            child: Text(
              _contacts,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: dao.findAll(),
        builder: (context, snapshot) {
          final List<Contact> contacts = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_waiting),
                    SizedBox(height: 20),
                    CircularProgressIndicator(),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(contact: contact);
                },
                itemCount: contacts.length,
              );
              break;
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(_error),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          );
        },
        child: Icon(Icons.add),
        mini: true,
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w300),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 12,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
