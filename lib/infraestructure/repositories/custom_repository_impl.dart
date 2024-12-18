import 'package:volenday_sdk_dart/domain/repositories/custom_repository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_data_source.dart';

class CustomRepositoryImpl implements CustomRepository {
  final HttpDataSource dataSource;

  CustomRepositoryImpl(this.dataSource);

  @override
  Future<dynamic> get(
    String endpoint,
    List<int>? ids, {
    Map<String, dynamic>? filter,
  }) {
    return dataSource.get(
      endpoint,
      ids: ids,
      query: filter,
    );
  }
}
