import 'package:volenday_sdk_dart/domain/repositories/put_repository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_put_datasource.dart';

class PutRepositoryImpl implements PutRepository {
  final HttpPutDatasource putDatasource;

  PutRepositoryImpl(this.putDatasource);

  @override
  Future<dynamic> put(
    String endPoint,
    int id,
    bool? autoPopulate,
    Map<String, dynamic> data,
  ) {
    return putDatasource.put(
      endPoint,
      id,
      autoPopulate: autoPopulate,
      data: data,
    );
  }
}
