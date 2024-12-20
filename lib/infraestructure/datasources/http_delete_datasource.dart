import 'package:http/http.dart' as http;
import 'package:volenday_sdk_dart/core/utils/http_utils/http_utils_delete.dart';

class HttpDeleteDatasource {
  final String baseUrl;
  final String token;

  HttpDeleteDatasource({
    required this.baseUrl,
    required this.token,
  });

  Future<dynamic> delete(
    String endPoint,
    int id,
  ) async {
    final url = Uri.parse('$baseUrl$endPoint/$id');

    final response = await http.delete(
      url,
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );

    return HttpUtilsDelete.handleResponse(response);
  }
}
