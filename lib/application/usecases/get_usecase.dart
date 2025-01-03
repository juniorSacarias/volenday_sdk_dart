import 'package:volenday_sdk_dart/domain/repositories/get_repository.dart';

class GetUseCase {
  final GetRepository repository;

  GetUseCase(this.repository);

  Future<dynamic> call(
    String endpoint,
    List<int>? ids,
    int? size,
    int? page,
    Map<String, int>? sort,
    bool? all,
    String? keywords,
    bool? autoPopulate,
    List<String>? populate,
    bool? count,
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
      autoPopulate,
      populate,
      count,
      filters,
    );
  }
}
