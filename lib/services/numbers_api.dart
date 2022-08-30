import 'dart:convert';
import 'package:http/http.dart' as http;

class NumbersApi {
  final http.Client _client = http.Client();
  final String _baseUrl = 'http://numbersapi.com/random/date?json';
  final String _numberBaseUrl = 'http://numbersapi.com';

  Future<Map<String, dynamic>> getRandomNumbersFact() async {
    // NumberModel model = NumberModel();
    dynamic response;
    try {
      response = await _client.get(Uri.parse(_baseUrl), headers: {
        'Content-Type': 'application/json',
      });
    } catch (e) {
      print('Error : $e');
    }
    var jsonResponse = json.decode(response.body);

    return jsonResponse;
  }

  Future<Map<String, dynamic>> getSpecificNumberFact(String number) async {
    // NumberModel model = NumberModel();
    dynamic response;
    try {
      response = await _client
          .get(Uri.parse('$_numberBaseUrl/$number/date?json'), headers: {
        'Content-Type': 'application/json',
      });
    } catch (e) {
      print('Error : $e');
    }
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);

    return jsonResponse;
  }
}
