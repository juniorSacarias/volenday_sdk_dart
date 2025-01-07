import 'package:volenday_sdk_dart/domain/repositories/get_many_repository.dart';

class GetManyUsecase {
  final GetManyRepository repository;

  GetManyUsecase(this.repository);

  Future<dynamic> call(
    String endPoint,
    List<Map<String, dynamic>> entities,
    String environment,
  ) {
    return repository.getMany(
      endPoint,
      entities,
      environment,
    );
  }
}
