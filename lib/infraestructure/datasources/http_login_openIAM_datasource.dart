import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:volenday_sdk_dart/core/utils/http_utils/http_login_openIAM.dart';

class HttpLoginOpeniamDatasource {
  final String baseUrl;

  HttpLoginOpeniamDatasource({
    required this.baseUrl,
  });

  Future<dynamic> loginWithOpenIAM(
      String apiKey,
      String code,
      String redirectUrl,
      String? environment,
      bool? remenberMe,
      List<String>? otherData) async {
    final queryParameters = HttpLoginOpeniam.buildQueryParameters(
      remenberMe,
      otherData,
      environment,
    );

    final endPoint = '/api/auth/openIAm';

    final url = Uri.parse('$baseUrl$endPoint').replace(
      queryParameters: queryParameters,
    );

    final combineHeaders = HttpLoginOpeniam.buildCustomHeaders(
      null,
    );

    final response = await http.post(
      url,
      headers: combineHeaders,
      body: jsonEncode({
        'apiKey': apiKey,
        'code': code,
        'redirectUrl': redirectUrl,
      }),
    );

    return HttpLoginOpeniam.handleResponse(response);
  }
}
