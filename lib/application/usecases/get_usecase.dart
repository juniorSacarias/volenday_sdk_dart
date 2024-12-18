import 'package:volenday_sdk_dart/domain/repositories/custom_repository.dart';

class GetUseCase {
  final CustomRepository repository;

  GetUseCase(this.repository);

  Future<dynamic> call(String endpoint, {Map<String, dynamic>? filter}) {
    return repository.get(
      endpoint,
      filter: filter,
    );
  }
}
