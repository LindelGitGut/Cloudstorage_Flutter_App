import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import '../auth/sessionmanager.dart';
import 'package:cloudstorage_flutter_app/conf/config.dart';


class FileRepository {
  final String baseUrl;
  final Session sessionManager = Session();

  FileRepository({this.baseUrl = Config.testURL});

  Future<void> uploadFile({required File file}) async {
    String url = '$baseUrl/api/files';

    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Add the file to the request
    request.files.add(await http.MultipartFile.fromPath(
      'file',
      file.path,
      filename: basename(file.path),
      contentType: MediaType('application', 'octet-stream'),
    ));

    print("Session HEaders:");
    print(sessionManager.headers);
    // Add the session headers
    request.headers.addAll(sessionManager.headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      print("File uploaded successfully");
    } else {
      print("File upload failed: ${response.statusCode}");
    }
  }
}
