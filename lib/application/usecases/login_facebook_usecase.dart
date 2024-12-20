import 'package:volenday_sdk_dart/domain/repositories/login_facebook_repository.dart';

class LoginFacebookUsecase {
  final LoginFacebookRepository repository;

  LoginFacebookUsecase(this.repository);

  Future<dynamic> call(
    String token,
    String apiKey, {
    String? environment,
    Map<String, String>? customHeaders,
  }) {
    return repository.loginWithFacebook(
      token,
      apiKey,
      environment,
      customHeaders,
    );
  }
}
