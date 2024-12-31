import 'package:volenday_sdk_dart/domain/repositories/login_openiam_repository.dart';

class LoginOpeniamUsecase {
  final LoginOpeniamRepository repository;

  LoginOpeniamUsecase(this.repository);

  Future<dynamic> call(
    String apiKey,
    String code,
    String redirectUrl, {
    String? environment,
    bool? rememberMe,
    List<String>? otherData,
  }) {
    return repository.loginOpenIam(
      apiKey,
      code,
      redirectUrl,
      environment,
      rememberMe,
      otherData,
    );
  }
}