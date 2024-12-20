import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpLoginEmail {
  static Map<String, String> buildQueryParameters(
    bool? remenberMe,
  ) {
    final queryParameters = <String, String>{};

    if (remenberMe != null) {
      queryParameters['remenberMe'] = remenberMe.toString();
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
