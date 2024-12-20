import 'package:volenday_sdk_dart/domain/repositories/login_facebook_repository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_login_facebook_datasource.dart';

class LoginFacebookRepositoryImpl implements LoginFacebookRepository {
  final HttpLoginFacebookDatasource loginFacebookDatasource;

  LoginFacebookRepositoryImpl(this.loginFacebookDatasource);

  @override
  Future<dynamic> loginWithFacebook(
    String token,
    String apiKey,
    String? environment,
    Map<String, String>? customHeaders,
  ) {
    return loginFacebookDatasource.loginWithFacebook(
      token,
      apiKey,
      environment,
      customHeaders,
    );
  }
}
