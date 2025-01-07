import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:volenday_sdk_dart/core/utils/http_utils/http_utils_post_many.dart';

class HttpPostManyDatasource {
  final String baseUrl;
  final String token;

  HttpPostManyDatasource({
    required this.baseUrl,
    required this.token,
  });

  Future<dynamic> postMany(
    String entityId,
    List<Map<String, dynamic>> data,
  ) async {
    final endPoint = '/api/e/$entityId/multiple';

    final url = Uri.parse('$baseUrl$endPoint');

    print('url: $url');
    print('data: $data');

    final response = await http.post(
      url,
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    return HttpUtilsPostMany.handleResponse(response);
  }
}
