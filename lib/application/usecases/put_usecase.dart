import 'package:volenday_sdk_dart/domain/repositories/put_repository.dart';

class PutUsecase {
  final PutRepository repository;

  PutUsecase(this.repository);

  Future<dynamic> call(
    String endpoint,
    int id,
    bool? autoPopulate,
    Map<String, dynamic> body,
  ) {
    return repository.put(
      endpoint,
      id,
      autoPopulate,
      body,
    );
  }
}