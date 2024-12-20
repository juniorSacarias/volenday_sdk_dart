import 'package:volenday_sdk_dart/domain/repositories/post_respository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_post_datasource.dart';

class PostRepositoryImpl implements PostRespository {
  final HttpPostDatasource postDatasource;

  PostRepositoryImpl(this.postDatasource);

  @override
  Future<dynamic> post(
    String endPoint,
    bool? autoPopulate,
    Map<String, dynamic> data,
  ) {
    return postDatasource.post(
      endPoint,
      autoPopulate: autoPopulate,
      data: data,
    );
  }
}
