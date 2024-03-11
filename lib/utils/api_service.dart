import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static const String _baseUrl = 'https://national-exam-card.onrender.com';

  Future<Map<String, dynamic>> fetchData({String path = 'versions'}) async {
    final response = await http.get(Uri.parse('$_baseUrl/api/v1/bible/$path'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> postData(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/post'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      print('Data posted successfully');
    } else {
      throw Exception('Failed to post data');
    }
  }
}
