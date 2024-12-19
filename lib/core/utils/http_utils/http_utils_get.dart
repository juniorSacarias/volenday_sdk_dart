import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpUtilsGet {
  static Map<String, String> buildQueryParameters(
    Map<String, dynamic>? query,
    List<int>? ids,
    int? size,
    int? page,
    Map<String, int>? sort,
    bool? all,
    String? keywords,
    List<Map<String, String>>? filters,
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

    if (all != null) {
      queryParameters['all'] = all.toString();
    }

    if (keywords != null) {
      queryParameters['keywords'] = keywords;
    }

    if (filters != null) {
      for (int i = 0; i < filters.length; i++) {
        filters[i].forEach((key, value) {
          queryParameters['filter[\$and][$i][$key]'] = '/$value/i';
        });
      }
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
