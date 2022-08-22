// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:http/http.dart' as http;

class NumbersApi {
  final http.Client _client = http.Client();
  final String _baseUrl = 'http://numbersapi.com/random/year?json';
  final queryParameters = {
    'Param1': 'json',
  };

  Future<String> getRandomNumbersFact() async {
    print('Called!');
    dynamic response = '';
    try {
      response = await _client.get(Uri.parse(_baseUrl), headers: {
        'Content-Type': 'application/json',
      });
      print(response.body);
    } catch (e) {
      print(e.toString());
    }
    var jsonResponse = json.decode(response.body);
    return jsonResponse;
  }
}
