import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:volenday_sdk_dart/core/utils/http_utils/http_utils_refreshtoken.dart';

class HttpRefreshtokenDatasource {
  final String baseUrl;
  final String token;

  HttpRefreshtokenDatasource({
    required this.baseUrl,
    required this.token,
  });

  Future<dynamic> refreshToken(
    String refreshToken, {
    List<String>? otherData,
  }) async {
    final endPoint = '/api/refreshToken';
    final url = Uri.parse('$baseUrl$endPoint');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'refreshToken': refreshToken,
          'otherData': otherData,
        }));

    return HttpUtilsRefreshtoken.handleResponse(response);
  }
}
