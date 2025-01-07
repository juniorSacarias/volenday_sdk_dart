import 'package:http/http.dart' as http;
import 'package:volenday_sdk_dart/core/utils/http_utils/http_utils_get_many.dart';

class HttpGetManyDatasource {
  final String baseUrl;
  final String token;

  HttpGetManyDatasource({
    required this.baseUrl,
    required this.token,
  });

  Future<dynamic> getMany(
    String endPoint,
    List<Map<String, dynamic>> entities,
    String environment,
  ) async {
    final queryParameters = HttpUtilsGetMany.buildQueryParameters(
      entities,
      environment,
    );

    final url = Uri.parse('$baseUrl$endPoint').replace(
      queryParameters: queryParameters,
    );

    print('URL: $url');

    final response = await http.get(
      url,
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );

    return HttpUtilsGetMany.handleResponse(response);
  }
}