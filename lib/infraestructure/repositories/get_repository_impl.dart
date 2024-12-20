import 'package:volenday_sdk_dart/domain/repositories/get_repository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_get_datasource.dart';

class GetRepositoryImpl implements GetRepository {
  final HttpGetDataSource getDataSource;

  GetRepositoryImpl(this.getDataSource);

  @override
  Future<dynamic> get(
    String endpoint,
    List<int>? ids,
    int? size,
    int? page,
    Map<String, int>? sort,
    bool? all,
    String? keywords,
    bool? autoPopulate,
    bool? count,
    List<Map<String, String>>? filters,
  ) {
    return getDataSource.get(
      endpoint,
      ids: ids,
      size: size,
      page: page,
      sort: sort,
      all: all,
      keywords: keywords,
      autoPopulate: autoPopulate,
      count: count,
      filters: filters,
    );
  }


}
