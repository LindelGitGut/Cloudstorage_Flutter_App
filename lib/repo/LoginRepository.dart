import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloudstorage_flutter_app/conf/config.dart';
import 'package:cloudstorage_flutter_app/auth/sessionmanager.dart';

class LoginRepository {
  final String baseUrl;

  LoginRepository({this.baseUrl = Config.testURL});

  Future<void> login({required String username, required String password}) async {
    // Basic Authentication Header erstellen
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final response = await http.post(
      Uri.parse('$baseUrl/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to log in ${response.statusCode}');
    } else {
      // Erfolgreiches Login, Authorization-Header in der Session speichern
      Session().setAuthHeader(username, password);
      print('Login successful: ${response.body}');
    }
  }

  Future<void> logout() async {
    // Authorization-Header löschen
    Session().clearAuthHeader();
    print('Logged out successfully');
  }
}
