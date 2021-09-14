import 'dart:convert';

import 'package:http/http.dart' as http;

class Messages {
  static const url =
      'https://findbasilprofilo-default-rtdb.firebaseio.com/messages.json';
  static Future<void> publish(String name, String email, String message) async {
    await http.post(Uri.parse(url),
        body: jsonEncode({
          'name': name,
          'email': email,
          'message': message,
        }));
  }
}
