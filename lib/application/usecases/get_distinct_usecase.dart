import 'package:volenday_sdk_dart/domain/repositories/get_distinct_repository.dart';

class GetDistinctUsecase {
  final GetDistinctRepository repository;

  GetDistinctUsecase(this.repository);

  Future<dynamic> call(
    String entityId,
    dynamic cacheExpiration,
    dynamic cacheKey,
    bool? count,
    List<String>? fields,
    List<Map<String, dynamic>>? filter,
    List<String>? distinct,
    List<Map<String, dynamic>>? sortBy,
  ) {
    return repository.getDistinct(
      entityId,
      cacheExpiration,
      cacheKey,
      count,
      fields,
      filter,
      distinct,
      sortBy,
    );
  }
}
