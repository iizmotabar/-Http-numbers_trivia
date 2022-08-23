import 'dart:convert';
import 'package:http/http.dart' as http;

class NumbersApi {
  final http.Client _client = http.Client();
  final String _baseUrl = 'http://numbersapi.com/random/year?json';
  final queryParameters = {
    'Param1': 'json',
  };

  Future<Map<String, dynamic>> getRandomNumbersFact() async {
    print('Called!');
    dynamic response;
    try {
      response = await _client.get(Uri.parse(_baseUrl), headers: {
        'Content-Type': 'application/json',
      });
    } catch (e) {
      print('This is the error : $e');
    }
    var jsonResponse = json.decode(response.body);
    print('This is the json response $jsonResponse');
    return jsonResponse;
  }
}
