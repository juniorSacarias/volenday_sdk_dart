import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpUtilsPost {

  static Map<String, String> buildQueryParameters(
    bool? autoPopulate,
  ) {
    final queryParameters = <String, String>{};

    if (autoPopulate != null) {
      queryParameters['autoPopulate'] = autoPopulate.toString();
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
