import 'package:http/http.dart' as http;
import 'dart:convert';
import"package:cloudstorage_flutter_app/conf/config.dart";
class LoginRepository {
  final String baseUrl;

  LoginRepository({this.baseUrl = Config.testURL}); // Ersetze durch deine IP-Adresse

  Future<void> login({required String username, required String password}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to log in');
    }
  }
}
