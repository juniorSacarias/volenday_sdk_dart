import 'package:volenday_sdk_dart/domain/repositories/delete_repository.dart';

class DeleteUsecase {
  final DeleteRepository repository;

  DeleteUsecase(this.repository);

  Future<dynamic> call(
    String endpoint,
    int id,
  ) {
    return repository.delete(
      endpoint,
      id,
    );
  }
}
