import 'package:http/http.dart' as http;
import 'package:volenday_sdk_dart/core/utils/http_utils_get.dart';

class HttpDataSource {
  final String baseUrl;
  final String token;

  HttpDataSource({
    required this.baseUrl,
    required this.token,
  });

  Future<dynamic> get(
    String endPoint, {
    Map<String, dynamic>? query,
    List<int>? ids,
    int? size,
    int? page,
  }) async {
    // Convertir la lista de IDs en una lista de parámetros de consulta
    final queryParameters = HttpUtilsGet.buildQueryParameters(
      query,
      ids,
      size,
      page,
    );

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

    return HttpUtilsGet.handleResponse(response);
  }
}
