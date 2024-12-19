import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:volenday_sdk_dart/core/utils/http_utils/http_utils_post.dart';

class HttpPostDatasource {
  final String baseUrl;
  final String token;

  HttpPostDatasource({
    required this.baseUrl,
    required this.token,
  });

  Future<dynamic> post(
    String endPoint, {
    required Map<String, dynamic> data,
  }) async {
    final url = Uri.parse('$baseUrl$endPoint');

    final response = await http.post(
      url,
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    return HttpUtilsPost.handleResponse(response);
  }
}
