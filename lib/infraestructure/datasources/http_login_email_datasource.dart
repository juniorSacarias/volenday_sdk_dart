import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:volenday_sdk_dart/core/utils/http_utils/http_login_email.dart';

class HttpLoginEmailDatasource {
  final String baseUrl;

  HttpLoginEmailDatasource({
    required this.baseUrl,
  });

  Future<dynamic> loginWithEmail({
    required String emailAddress,
    required String password,
    required String apiKey,
  }) async {

    print('emailAddress: $emailAddress');
    print('password: $password');
    print('apiKey: $apiKey');

    final endPoint = '/api/auth/email';

    final url = Uri.parse('$baseUrl$endPoint');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'emailAddress': emailAddress,
        'password': password,
        'apiKey': apiKey,
      }),
    );

    return HttpLoginEmail.handleResponse(response);
  }
}
