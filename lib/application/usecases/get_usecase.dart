import 'package:volenday_sdk_dart/domain/repositories/custom_repository.dart';

class GetUseCase {
  final CustomRepository repository;

  GetUseCase(this.repository);

  Future<dynamic> call(
    String endpoint,
    List<int>? ids,
    int? size, 
    int? page,
    Map<String, int>? sort, 
    bool? all, {
    Map<String, dynamic>? filter,
  }) {
    return repository.get(
      endpoint,
      ids,
      size,
      page,
      sort,
      all!,
      filter: filter,
    );
  }
}
