import 'dart:convert';
import 'package:http/http.dart' as http;

class Session {
  // Singleton
  Session._privateConstructor();
  static final Session _instance = Session._privateConstructor();

  factory Session() {
    return _instance;
  }

  Map<String, String> headers = {};

  // Methode zum Setzen des Authorization-Headers
  void setAuthHeader(String username, String password) {
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    headers['Authorization'] = basicAuth;
  }

  Future<Map> get(String url) async {
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri, headers: headers);
    updateCookie(response);
    return json.decode(response.body);
  }

  Future<Map> post(String url, dynamic data) async {
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(uri, body: data, headers: headers);
    updateCookie(response);
    return json.decode(response.body);
  }

  void updateCookie(http.Response response) {
    //TODO debugging comment out or delete
    print("erhaltene Header updateCookie: ");

    for (String val in response.headers.keys) {
      print(val);
    }

    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      print(rawCookie);
      int index = rawCookie.indexOf(';');
      headers['cookie'] = (index == -1) ? rawCookie : rawCookie.substring(0, index);
      print(headers['cookie']);
    }
  }

  void clearCookie() {
    headers.clear();
  }

  void clearAuthHeader() {
    headers.remove('Authorization');
  }
}