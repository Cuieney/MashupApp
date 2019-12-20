import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class HttpRequest {
  static Future<dynamic> request(String url, Method method,
      {Map<String, String> head,
      Map<String, dynamic> body,
      bool needToken}) async {
    if (head == null) {
      head = new Map();
      if(needToken == null){
        needToken = false;
      }
      if (needToken) {
        var token = _prefs.then((SharedPreferences share) {
          return share.get("token");
        });
        head['Authorization'] = token as String;
      }
    }
    if (body == null) {
      body = new Map();
    }
    head['Content-Type'] = 'application/json';

    if (method == Method.POST) {
      return http
          .post(url, headers: head, body: jsonEncode(body))
          .then((http.Response response) {
        if (response.statusCode == 200) {
          return jsonDecode(response.body);
        } else {
          return Future.error(
              "response error ${response.statusCode}  ${response.body}");
        }
      });
    } else {
      return http.get(url, headers: head).then((http.Response response) {
        if (response.statusCode == 200) {
          return jsonDecode(response.body);
        } else {
          return Future.error(
              "response error ${response.statusCode}  ${response.body}");
        }
      });
    }
  }
}

enum Method { POST, GET }
