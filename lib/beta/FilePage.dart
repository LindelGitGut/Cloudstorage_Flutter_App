import 'dart:io';
import 'package:cloudstorage_flutter_app/repo/FileRepository.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({super.key});



  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {


  //Temporary using Repository directly in app for testing
  //TODO Remove Repo an dUse Bloc instead

  FileRepository fileRepository = FileRepository();

  File? _selectedFile;

  Widget _getFileUploadButton() {
    if (_selectedFile != null) {
      return TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.green, // foreground
        ),
        onPressed: () {
          // Handle file upload
          print("Uploading file: ${_selectedFile!.path}");
          fileRepository.uploadFile(file: _selectedFile!);

        },
        child: Text('Upload selected File'),
      );
    } else {
      return Container(); // Return an empty container if no file is selected
    }
  }

  List<Widget> _getFileTiles() {
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

  Future<void> _pickUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    } else {
      setState(() {
        _selectedFile = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('Files Page'),
        ),
        Text("Upload new File"),
        IconButton(
          onPressed: () {
            print("Uploadbutton pressed!");
            _pickUploadFile();
          },
          icon: Icon(Icons.upload),
        ),
        _getFileUploadButton(),
        SizedBox(height: 20), // Add spacing between elements
        Text("Your saved Files"),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: _getFileTiles(),
          ),
        ),
      ],
    );
  }
}
