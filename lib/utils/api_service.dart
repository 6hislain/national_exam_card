import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static const String _baseUrl = 'https://national-exam-card.onrender.com';

  Future<Map<String, dynamic>> fetchData({String path = 'application'}) async {
    final response = await http.get(Uri.parse('$_baseUrl/api/v1/$path'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<http.Response> postData(
      {Map<String, dynamic> data = const {}, String path = ''}) async {
    return await http.post(
      Uri.parse('$_baseUrl/api/v1/$path'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  }
}
