import 'package:volenday_sdk_dart/domain/repositories/post_many_repository.dart';

class PostManyUsecase {
  final PostManyRepository repository;

  PostManyUsecase(this.repository);

  Future<dynamic> call(
    String entityId,
    List<Map<String, dynamic>> data,
  ) {
    return repository.postMany(
      entityId,
      data,
    );
  }
}
