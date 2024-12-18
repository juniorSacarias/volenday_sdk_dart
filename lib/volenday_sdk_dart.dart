import 'package:volenday_sdk_dart/application/usecases/get_usecase.dart';
import 'package:volenday_sdk_dart/core/config/config.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_data_source.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/custom_repository_impl.dart';

class VolendaySdkDart {
  final GetUseCase getUseCase;

  VolendaySdkDart._internal(this.getUseCase);

  static Future<VolendaySdkDart> create({
    required String environment,
    required String envFilePath,
  }) async {
    // Load environment variables
    await Config.load(environment: environment);

    // Check if the env file is loaded
    if (Config.currentEnvironment.isNotEmpty) {
      print('Env file loaded successfully.');
    } else {
      print('Error loading the env file.');
    }

    // Configure the environment
    final currentEnvironment = Config.currentEnvironment;

    final token = Config.token;

    // Create the datasource and repository
    final baseUrl = currentEnvironment['baseUrl'];

    final dataSource = HttpDataSource(
      baseUrl: baseUrl,
      token: token,
    );

    final repository = CustomRepositoryImpl(dataSource);

    return VolendaySdkDart._internal(GetUseCase(repository));
  }

  Future<dynamic> get(
    String endpoint, {
    List<int>? ids,
    Map<String, dynamic>? filter,
  }) {
    return getUseCase(
      endpoint,
      ids,
      filter: filter,
    );
  }
}
