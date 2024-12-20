import 'package:volenday_sdk_dart/domain/repositories/delete_repository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_delete_datasource.dart';

class DeleteRepositoryImpl implements DeleteRepository {
  final HttpDeleteDatasource deleteDatasource;

  DeleteRepositoryImpl(this.deleteDatasource);

  @override
  Future<dynamic> delete(
    String endPoint,
    int id,
  ) {
    return deleteDatasource.delete(
      endPoint,
      id,
    );
  }
}
