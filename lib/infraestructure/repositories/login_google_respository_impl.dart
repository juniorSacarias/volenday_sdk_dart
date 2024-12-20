
import 'package:volenday_sdk_dart/domain/repositories/login_google_repository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_login_google_datasource.dart';

class LoginGoogleRespositoryImpl implements LoginGoogleRepository {
  final HttpLoginGoogleDatasource loginGoogleDatasource;

  LoginGoogleRespositoryImpl(this.loginGoogleDatasource);

  @override
  Future<dynamic> loginWithGoogle(
    String token,
    String apiKey,
    String? environment,
    Map<String, String>? customHeaders,
  ) {
    return loginGoogleDatasource.loginWithGoogle(
      token,
      apiKey,
      environment,
      customHeaders,
    );
  }
}