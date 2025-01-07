import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpUtilsGetMany {
  static Map<String, String> buildQueryParameters(
    List<Map<String, dynamic>> entities,
    String environment,
  ) {
    final queryParameters = <String, String>{};

    for (int i = 0; i < entities.length; i++) {
      entities[i].forEach((key, value) {
        queryParameters['entities[$i][$key]'] = value.toString();
      });
    }

    return queryParameters;
  }

  static dynamic handleResponse(http.Response response) {
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
