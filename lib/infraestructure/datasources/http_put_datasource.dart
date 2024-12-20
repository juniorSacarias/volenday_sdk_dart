import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:volenday_sdk_dart/core/utils/http_utils/http_utils_put.dart';

class HttpPutDatasource {
  final String baseUrl;
  final String token;

  HttpPutDatasource({
    required this.baseUrl,
    required this.token,
  });

  Future<dynamic> put(
    String endPoint,
    int id, {
    required Map<String, dynamic> data,
  }) async {
    final url = Uri.parse('$baseUrl$endPoint/$id');
    
    final response = await http.put(
      url,
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    return HttpUtilsPut.handleResponse(response);
  }
}
