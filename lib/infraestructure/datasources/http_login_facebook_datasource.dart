import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:volenday_sdk_dart/core/utils/http_utils/http_login_facebook.dart';

class HttpLoginFacebookDatasource {
  final String baseUrl;
  final String token;

  HttpLoginFacebookDatasource({
    required this.baseUrl,
    required this.token,
  });

  Future<dynamic> loginWithFacebook(
    String apiKey,
    String token,
    String? environment,
    Map<String, String>? customHeaders,
  ) async {
    final queryParameters = HttpLoginFacebook.buildQueryParameters(
      environment,
    );

    final endPoint = 'api/auth/social/google';

    final url = Uri.parse('$baseUrl$endPoint').replace(
      queryParameters: queryParameters,
    );

    final combineHeaders = HttpLoginFacebook.buildCustomHeaders(
      customHeaders,
      token,
    );

    final reponse = await http.post(
      url,
      headers: combineHeaders,
      body: jsonEncode({
        'apiKey': apiKey,
        'token': token,
      }),
    );

    return HttpLoginFacebook.handleResponse(reponse);
  }
}
