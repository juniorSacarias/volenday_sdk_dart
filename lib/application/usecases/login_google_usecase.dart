import 'package:volenday_sdk_dart/domain/repositories/login_google_repository.dart';

class LoginGoogleUsecase {
  final LoginGoogleRepository repository;

  LoginGoogleUsecase(this.repository);

  Future<dynamic> call(
    String token,
    String apiKey, {
    String? environment,
    Map<String, String>? customHeaders,
  }) {
    return repository.loginWithGoogle(
      token,
      apiKey,
      environment,
      customHeaders,
    );
  }
}
