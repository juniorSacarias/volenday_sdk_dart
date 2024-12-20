import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:volenday_sdk_dart/core/utils/http_utils/http_login_google.dart';

class HttpLoginGoogleDatasource {
  final String baseUrl;
  final String token;

  HttpLoginGoogleDatasource({
    required this.baseUrl,
    required this.token,
  });

  Future<dynamic> loginWithGoogle(
    String apiKey,
    String token,
    String? environment,
    Map<String, String>? customHeaders,
  ) async {
    final queryParameters = HttpLoginGoogle.buildQueryParameters(
      environment,
    );

    final endPoint = 'api/auth/social/google';

    final url = Uri.parse('$baseUrl$endPoint').replace(
      queryParameters: queryParameters,
    );

    final combineHeaders = HttpLoginGoogle.buildCustomHeaders(
      token,
      customHeaders,
    );

    final reponse = await http.post(
      url,
      headers: combineHeaders,
      body: jsonEncode({
        'apiKey': apiKey,
        'token': token,
      }),
    );

    return HttpLoginGoogle.handleResponse(reponse);
  }
}
