import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CredentialsPage.dart';
import 'FilePage.dart';
import 'NotesPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedDrawerItem = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return FilesPage();
      case 1:
        return CredentialsPage();
      case 2:
        return NotesPage();
      default:
        return FilesPage();
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerItem = index);
    Navigator.of(context).pop(); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cloudstorage Flutter App"),
      ),
      body: _getDrawerItemWidget(_selectedDrawerItem),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Here should be your Account name"),
              accountEmail: Text("Email Address of account"),
            ),
            Text("How are you Today?"),
            Text("Any new Files for me to feed?"),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Icon(Icons.file_copy),
                    title: Text('Files'),
                    selected: _selectedDrawerItem == 0,
                    onTap: () => _onSelectItem(0),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Credentials'),
                    selected: _selectedDrawerItem == 1,
                    onTap: () => _onSelectItem(1),
                  ),
                  ListTile(
                    leading: Icon(Icons.note),
                    title: Text('Notes'),
                    selected: _selectedDrawerItem == 2,
                    onTap: () => _onSelectItem(2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
