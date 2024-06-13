import 'dart:convert';

import 'package:http/http.dart' as http;




class Session {


// as Singleton
 Session._privateConstructor();
 static final Session _instance = Session._privateConstructor();

 factory Session () {

   return _instance;
 }

  Map<String, String> headers = {};

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
    print("erhaltene Header updateCookie: " );

    for (String val in response.headers.keys){

        print(val);
    }

    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['Cookie'] =
      (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

  void clearCookie(){
    headers.clear();
  }
}