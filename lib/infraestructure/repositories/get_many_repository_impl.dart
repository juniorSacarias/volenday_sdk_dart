import 'package:volenday_sdk_dart/domain/repositories/get_many_repository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_get_many_datasource.dart';

class GetManyRepositoryImpl implements GetManyRepository {
  final HttpGetManyDatasource getManyDataSource;

  GetManyRepositoryImpl(this.getManyDataSource);

  @override
  Future<dynamic> getMany(
    String endPoint,
    List<Map<String, dynamic>> entities,
    String environment,
  ) {
    return getManyDataSource.getMany(
      endPoint,
      entities,
      environment,
    );
  }
}
