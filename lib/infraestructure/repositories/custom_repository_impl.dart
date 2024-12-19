import 'package:volenday_sdk_dart/domain/repositories/custom_repository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_data_source.dart';

class CustomRepositoryImpl implements CustomRepository {
  final HttpDataSource dataSource;

  CustomRepositoryImpl(this.dataSource);

  @override
  Future<dynamic> get(
    String endpoint,
    List<int>? ids,
    int? size,
    int? page,
    Map<String, int>? sort,
    bool? all, 
    String? keywords, {
    Map<String, dynamic>? filter,
  }) {
    return dataSource.get(
      endpoint,
      ids: ids,
      size: size,
      page: page,
      sort: sort,
      all: all,
      keywords: keywords,
      query: filter,
    );
  }
}
