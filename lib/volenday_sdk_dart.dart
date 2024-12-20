import 'package:volenday_sdk_dart/application/usecases/login_email_usecase.dart';
import 'package:volenday_sdk_dart/core/sdk/sdk_config.dart';
import 'package:volenday_sdk_dart/core/sdk/sdk_initialization.dart';
import 'package:volenday_sdk_dart/application/usecases/delete_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/get_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/post_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/put_usecase.dart';

class VolendaySdkDart {
  final GetUseCase getUseCase;
  final PostUsecase postUsecase;
  final PutUsecase putUsecase;
  final DeleteUsecase deleteUsecase;
  final LoginEmailUsecase loginEmailUsecase;

  VolendaySdkDart._internal(
    this.getUseCase,
    this.postUsecase,
    this.putUsecase,
    this.deleteUsecase,
    this.loginEmailUsecase,
  );

  static Future<VolendaySdkDart> create({
    required String environment,
    String? envFilePath,
    String? token,
  }) async {
    final config = await SdkConfig.loadConfig(
      environment: environment,
      envFilePath: envFilePath,
      token: token,
    );

    final initialization = await SdkInitialization.initialize(
      baseUrl: config['baseUrl'],
      token: config['token'],
    );

    return VolendaySdkDart._internal(
      initialization['getUseCase'],
      initialization['postUseCase'],
      initialization['putUseCase'],
      initialization['deleteUseCase'],
      initialization['loginEmailUseCase'],
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
    bool? autoPopulate,
    bool? count,
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
      autoPopulate,
      count,
      filters,
    );
  }

  Future<dynamic> post(
    String endpoint, {
    bool? autoPopulate,
    required Map<String, dynamic> data,
  }) {
    return postUsecase(
      endpoint,
      autoPopulate,
      data,
    );
  }

  Future<dynamic> put(
    String endpoint,
    int id, {
    bool? autoPopulate,
    required Map<String, dynamic> body,
  }) {
    return putUsecase(
      endpoint,
      id,
      autoPopulate,
      body,
    );
  }

  Future<dynamic> delete(
    String endpoint,
    int id,
  ) {
    return deleteUsecase(
      endpoint,
      id,
    );
  }

  Future<dynamic> loginWithEmail(
    String? endPoint,
    String emailAddress,
    String password,
    String apiKey, {
    bool? remenberMe,
  }) {
    return loginEmailUsecase(
      emailAddress,
      password,
      apiKey,
      rememberMe: remenberMe,
    );
  }
}
