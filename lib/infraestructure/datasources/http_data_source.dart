import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpDataSource {
  final String baseUrl;
  final String token;

  HttpDataSource({
    required this.baseUrl,
    required this.token,
  });

  Future<dynamic> get(
    String endPoint, {
    Map<String, dynamic>? query,
    List<int>? ids,
  }) async {
    // Convertir la lista de IDs en una lista de parámetros de consulta
    final queryParameters = {
      if (query != null)
        ...query.map((key, value) => MapEntry(key, value.toString())),
      if (ids != null)
        ...ids
            .asMap()
            .map((index, id) => MapEntry('ids[$index]', id.toString())),
    };

    final url = Uri.parse('$baseUrl$endPoint')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      url,
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return {
        'statusCode': response.statusCode,
        'body': jsonDecode(response.body),
      };
    } else {
      throw Exception('Error: ${response.statusCode} ${response.body}');
    }
  }
}
