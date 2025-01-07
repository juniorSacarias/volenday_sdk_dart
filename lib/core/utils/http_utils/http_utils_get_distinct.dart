import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpUtilsGetDistinct {
  static Map<String, String> buildQueryParameters(
    String entityId,
    dynamic cacheExpiration,
    dynamic cacheKey,
    bool? count,
    List<String>? fields,
    List<Map<String, dynamic>>? filter,
    List<String>? distinct,
    List<Map<String, dynamic>>? sortBy,
  ) {
    final queryParameters = <String, String>{};

    queryParameters['entityId'] = entityId;

    if (cacheExpiration != null) {
      queryParameters['cacheExpiration'] = cacheExpiration.toString();
    }

    if (cacheKey != null) {
      queryParameters['cacheKey'] = cacheKey.toString();
    }

    if (count != null) {
      queryParameters['count'] = count.toString();
    }

    if (fields != null) {
      queryParameters['fields'] = jsonEncode(fields);
    }

    if (filter != null) {
      queryParameters['filter'] = jsonEncode(filter);
    }

    if (distinct != null) {
      queryParameters['distinct'] = jsonEncode(distinct);
    }

    if (sortBy != null) {
      queryParameters['sortBy'] = jsonEncode(sortBy);
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
