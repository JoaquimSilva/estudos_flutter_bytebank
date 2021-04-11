import 'package:estudos_flutter_bytebank/screens/contacts_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key key,
  }) : super(key: key);

  static const String _name = 'Byte Bank';
  static const String _contacts = 'Contacts';
  static const String _mensage = 'Saving your money with us.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            _name,
            style: TextStyle(
              color: Colors.cyan[400],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.monetization_on_outlined,
            color: Colors.cyan,
            size: 146,
          ),
          Text(
            _mensage,
            style: TextStyle(
              fontSize: 16,
              color: Colors.cyan[400],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ContactsList()),
                  );
                },
                child: Center(
                  child: Container(
                      height: 100,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.people_alt, color: Colors.white),
                          Text(_contacts, style: TextStyle(color: Colors.white))
                        ],
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
