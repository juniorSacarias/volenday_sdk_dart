import 'package:volenday_sdk_dart/domain/repositories/post_respository.dart';

class PostUsecase {
  final PostRespository repository;

  PostUsecase(this.repository);

  Future<dynamic> call(
    String endpoint,
    Map<String, dynamic> body,
  ) {
    return repository.post(
      endpoint,
      body,
    );
  }
}
