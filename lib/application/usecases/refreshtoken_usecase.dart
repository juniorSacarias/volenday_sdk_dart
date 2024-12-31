import 'package:volenday_sdk_dart/domain/repositories/refreshtoken_repository.dart';

class RefreshtokenUsecase {
  final RefreshtokenRepository repository;

  RefreshtokenUsecase(this.repository);

  Future<dynamic> call(
    String refreshToken,
    List<String>? otherData,
  ) {
    return repository.refreshToken(
      refreshToken,
      otherData,
    );
  }
}
