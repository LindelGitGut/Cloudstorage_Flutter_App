import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({super.key});

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  List<Widget> _getFileTiles() {
    //TODO add Bloc Function to get all Current Files
    return [
      ListTile(
        title: Text("Placeholder File 1"),
      ),
      ListTile(
        title: Text("Placeholder File 2"),
      ),
      // Add more ListTiles for each file
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('Files Page'),
        ),
        IconButton(
            onPressed: () {
              print("Uploadbutton pressed!");
            } /* _uploadNewFile,*/,
            icon: Icon(Icons.upload)),
        Text("Upload new File"),
        SizedBox(height: 20), // Add spacing between elements
        Text("Your saved Files"),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: _getFileTiles(),
          ),
        )
      ],
    );
  }
}
