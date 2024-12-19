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
    bool? all,
    String? keywords,
    List<Map<String, String>>? filters,
  ) {
    return repository.get(
      endpoint,
      ids,
      size,
      page,
      sort,
      all,
      keywords,
      filters,
    );
  }
}
