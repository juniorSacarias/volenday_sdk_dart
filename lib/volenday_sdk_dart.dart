import 'package:volenday_sdk_dart/application/usecases/get_usecase.dart';
import 'package:volenday_sdk_dart/core/config/config.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_data_source.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/custom_repository_impl.dart';

class VolendaySdkDart {
  final GetUseCase getUseCase;

  VolendaySdkDart._internal(this.getUseCase);

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

    final dataSource = HttpDataSource(
      baseUrl: baseUrl,
      token: finalToken,
    );

    final repository = CustomRepositoryImpl(dataSource);

    return VolendaySdkDart._internal(GetUseCase(repository));
  }

  Future<dynamic> get(
    String endpoint, {
    List<int>? ids,
    int? size,
    int? page,
    Map<String, dynamic>? filter,
  }) {
    return getUseCase(
      endpoint,
      ids,
      size,
      page,
      filter: filter,
    );
  }
}
