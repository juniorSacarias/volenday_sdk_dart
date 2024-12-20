import 'package:volenday_sdk_dart/infraestructure/datasources/http_get_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_post_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_put_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_delete_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/get_repository_impl.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/post_repository_impl.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/put_repository_impl.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/delete_repository_impl.dart';
import 'package:volenday_sdk_dart/application/usecases/delete_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/get_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/post_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/put_usecase.dart';

class SdkInitialization {
  static Future<Map<String, dynamic>> initialize({
    required String baseUrl,
    required String token,
  }) async {
    final getDataSource = HttpGetDataSource(
      baseUrl: baseUrl,
      token: token,
    );

    final postDataSource = HttpPostDatasource(
      baseUrl: baseUrl,
      token: token,
    );

    final putDataSource = HttpPutDatasource(
      baseUrl: baseUrl,
      token: token,
    );

    final deleteDataSource = HttpDeleteDatasource(
      baseUrl: baseUrl,
      token: token,
    );

    final getRepository = GetRepositoryImpl(getDataSource);
    final postRepository = PostRepositoryImpl(postDataSource);
    final putRepository = PutRepositoryImpl(putDataSource);
    final deleteRepository = DeleteRepositoryImpl(deleteDataSource);

    return {
      'getUseCase': GetUseCase(getRepository),
      'postUseCase': PostUsecase(postRepository),
      'putUseCase': PutUsecase(putRepository),
      'deleteUseCase': DeleteUsecase(deleteRepository),
    };
  }
}