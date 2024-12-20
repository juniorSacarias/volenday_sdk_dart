import 'package:volenday_sdk_dart/domain/repositories/login_email_respository.dart';

class LoginEmailUsecase {
  final LoginEmailRespository repository;

  LoginEmailUsecase(this.repository);

  Future<dynamic> call(
    String emailAddress,
    String password,
    String apiKey, {
    bool? rememberMe,
  }) {
    return repository.loginWithEmail(
      emailAddress,
      password,
      apiKey,
      rememberMe,
    );
  }
}
