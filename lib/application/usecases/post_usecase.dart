import 'package:volenday_sdk_dart/domain/repositories/post_respository.dart';

class PostUsecase {
  final PostRespository repository;

  PostUsecase(this.repository);

  Future<dynamic> call(
    String endpoint,
    bool? autoPopulate,
    Map<String, dynamic> body,
  ) {
    return repository.post(
      endpoint,
      autoPopulate,
      body,
    );
  }
}
