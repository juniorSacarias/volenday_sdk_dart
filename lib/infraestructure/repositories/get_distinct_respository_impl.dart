import 'package:volenday_sdk_dart/domain/repositories/get_distinct_repository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_get_distinct_datasource.dart';

class GetDistinctRespositoryImpl implements GetDistinctRepository {
  final HttpGetDistinctDatasource getDistinctDatasource;

  GetDistinctRespositoryImpl(this.getDistinctDatasource);

  @override
  Future<dynamic> getDistinct(
    String entityId,
    dynamic cacheExpiration,
    dynamic cacheKey,
    bool? count,
    List<String>? fields,
    List<Map<String, dynamic>>? filter,
    List<String>? distinct,
    List<Map<String, dynamic>>? sortBy,
  ) {
    return getDistinctDatasource.getDistintc(
      entityId,
      cacheExpiration: cacheExpiration,
      cacheKey: cacheKey,
      count: count,
      fields: fields,
      filter: filter,
      distinct: distinct,
      sortBy: sortBy,
    );
  }
}
