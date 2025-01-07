import 'package:http/http.dart' as http;
import 'package:volenday_sdk_dart/core/utils/http_utils/http_utils_get_distinct.dart';

class HttpGetDistinctDatasource {
  final String baseUrl;
  final String token;

  HttpGetDistinctDatasource({
    required this.baseUrl,
    required this.token,
  });

  Future<dynamic> getDistintc(
    String entityId, {
    dynamic cacheExpiration,
    dynamic cacheKey,
    bool? count,
    List<String>? fields,
    List<Map<String, dynamic>>? filter,
    List<String>? distinct,
    List<Map<String, dynamic>>? sortBy,
  }) async {
    final queryParameters = HttpUtilsGetDistinct.buildQueryParameters(
      entityId,
      cacheExpiration,
      cacheKey,
      count,
      fields,
      filter,
      distinct,
      sortBy,
    );

    final endPoint = '/api/e/$entityId/distinct';

    final url = Uri.parse('$baseUrl$endPoint').replace(
      queryParameters: queryParameters,
    );

    final response = await http.get(
      url,
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );

    return HttpUtilsGetDistinct.handleResponse(response);
  }
}
