import 'package:volenday_sdk_dart/domain/repositories/post_many_repository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_post_many_datasource.dart';

class PostManyRespositoryImpl implements PostManyRepository {
  final HttpPostManyDatasource postManyDatasource;

  PostManyRespositoryImpl(this.postManyDatasource);

  @override
  Future<dynamic> postMany(
    String entityId,
    List<Map<String, dynamic>> data,
  ) {
    return postManyDatasource.postMany(
      entityId,
      data,
    );
  }
}
