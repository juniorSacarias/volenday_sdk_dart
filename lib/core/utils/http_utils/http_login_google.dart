import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpLoginGoogle {
  static Map<String, String> buildQueryParameters(
    String? environment,
  ) {
    final queryParameters = <String, String>{};

    if (environment != null) {
      queryParameters['environment'] = environment;
    }

    return queryParameters;
  }

  static Map<String, String> buildCustomHeaders(
    String token,
    Map<String, String>? customHeaders,
  ) {
    final defaultHeaders = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    if (customHeaders != null) {
      return {...defaultHeaders, ...customHeaders};
    }

    return defaultHeaders;
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
