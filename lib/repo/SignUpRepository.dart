import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloudstorage_flutter_app/conf/config.dart';

class SignupRepository {
  final String baseUrl;

  SignupRepository({this.baseUrl = Config.testURL});

  Future<void> signup({required String username, required String password, required String firstName, required String lastName}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to sign up: ${response.statusCode}');
    }
  }
}