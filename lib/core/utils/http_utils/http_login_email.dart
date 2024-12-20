import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpLoginEmail {
  static Map<String, String> buildQueryParameters(
    bool? remenberMe,
    String? environment,
  ) {
    final queryParameters = <String, String>{};

    if (remenberMe != null) {
      queryParameters['remenberMe'] = remenberMe.toString();
    }

    if (environment != null) {
      queryParameters['environment'] = environment;
    }

    return queryParameters;
  }

  static Map<String, String> buildCustomHeaders(
    Map<String, String>? customHeaders,
  ) {
    final defaultHeaders = {
      'Content-Type': 'application/json',
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
