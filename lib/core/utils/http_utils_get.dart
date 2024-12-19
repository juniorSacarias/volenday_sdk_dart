import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpUtilsGet {
  static Map<String, String> buildQueryParameters(
    Map<String, dynamic>? query,
    List<int>? ids,
    int? size,
    int? page,
    Map<String, int>? sort,
  ) {
    final queryParameters = <String, String>{};

    if (query != null) {
      queryParameters.addAll(
        query.map((key, value) => MapEntry(key, value.toString())),
      );
    }

    if (ids != null) {
      queryParameters.addAll(
        ids.asMap().map((index, id) => MapEntry('ids[$index]', id.toString())),
      );
    }

    if (size != null) {
      queryParameters['limit'] = size.toString();
    }

    if (page != null) {
      queryParameters['page'] = page.toString();
    }

    if (sort != null) {
      sort.forEach((key, value) {
        queryParameters['sortBy[$key]'] = value.toString();
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
