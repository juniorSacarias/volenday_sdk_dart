import 'package:volenday_sdk_dart/application/usecases/get_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/post_usecase.dart';
import 'package:volenday_sdk_dart/core/config/config.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_get_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_post_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/get_repository_impl.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/post_repository_impl.dart';

class VolendaySdkDart {
  final GetUseCase getUseCase;
  final PostUsecase postUsecase;

  VolendaySdkDart._internal(
    this.getUseCase,
    this.postUsecase,
  );

  static Future<VolendaySdkDart> create({
    required String environment,
    String? envFilePath,
    String? token,
  }) async {
    // Load environment variables or use provided token
    await Config.load(
      environment: environment,
      envFilePath: envFilePath,
      token: token,
    );

    // Configure the environment
    final currentEnvironment = Config.currentEnvironment;

    // Create the datasource and repository
    final baseUrl = currentEnvironment['baseUrl'];
    final finalToken = Config.token;

    final getDataSource = HttpGetDataSource(
      baseUrl: baseUrl,
      token: finalToken,
    );

    final postDatasource = HttpPostDatasource(
      baseUrl: baseUrl,
      token: finalToken,
    );

    final getRepository = GetRepositoryImpl(getDataSource);

    final postRepository = PostRepositoryImpl(postDatasource);

    return VolendaySdkDart._internal(
      GetUseCase(getRepository),
      PostUsecase(postRepository),
    );
  }

  Future<dynamic> get(
    String endpoint, {
    List<int>? ids,
    int? size,
    int? page,
    Map<String, int>? sort,
    bool? all,
    String? keywords,
    List<Map<String, String>>? filters,
  }) {
    return getUseCase(
      endpoint,
      ids,
      size,
      page,
      sort,
      all,
      keywords,
      filters,
    );
  }

  Future<dynamic> post(
    String endpoint, {
    required Map<String, dynamic> data,
  }) {
    return postUsecase(
      endpoint,
      data,
    );
  }
}
