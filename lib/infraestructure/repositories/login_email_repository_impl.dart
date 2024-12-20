import 'package:volenday_sdk_dart/domain/repositories/login_email_respository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_login_email_datasource.dart';

class LoginEmailRepositoryImpl implements LoginEmailRespository {
  final HttpLoginEmailDatasource loginEmailDatasource;

  LoginEmailRepositoryImpl(this.loginEmailDatasource);

  @override
  Future<dynamic> loginWithEmail(
    String emailAddress,
    String password,
    String apiKey,
    bool? rememberMe,
  ) {
    return loginEmailDatasource.loginWithEmail(
      emailAddress,
      password,
      apiKey,
      rememberMe,
    );
  }
}
