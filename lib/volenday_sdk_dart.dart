import 'package:volenday_sdk_dart/application/usecases/get_distinct_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/get_many_usecase.dart';
import 'package:volenday_sdk_dart/core/sdk/sdk_config.dart';
import 'package:volenday_sdk_dart/core/sdk/sdk_initialization.dart';
import 'package:volenday_sdk_dart/application/usecases/delete_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/get_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/post_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/put_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/login_email_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/login_facebook_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/login_google_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/login_openiam_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/refreshtoken_usecase.dart';

class VolendaySdkDart {
  final GetUseCase getUseCase;
  final GetManyUsecase getManyUsecase;
  final GetDistinctUsecase getDistinctUsecase;
  final PostUsecase postUsecase;
  final PutUsecase putUsecase;
  final DeleteUsecase deleteUsecase;
  final LoginEmailUsecase loginEmailUsecase;
  final LoginGoogleUsecase loginGoogleUsecase;
  final LoginFacebookUsecase loginFacebookUsecase;
  final LoginOpeniamUsecase loginOpenIamUseCase;
  final RefreshtokenUsecase refreshTokenUseCase;

  VolendaySdkDart._internal(
    this.getUseCase,
    this.getManyUsecase,
    this.getDistinctUsecase,
    this.postUsecase,
    this.putUsecase,
    this.deleteUsecase,
    this.loginEmailUsecase,
    this.loginGoogleUsecase,
    this.loginFacebookUsecase,
    this.loginOpenIamUseCase,
    this.refreshTokenUseCase,
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
    // Todo: implement dependecies injection
    return VolendaySdkDart._internal(
      initialization['getUseCase'],
      initialization['getManyUseCase'],
      initialization['getDistinctUseCase'],
      initialization['postUseCase'],
      initialization['putUseCase'],
      initialization['deleteUseCase'],
      initialization['loginEmailUseCase'],
      initialization['loginGoogleUseCase'],
      initialization['loginFacebookUseCase'],
      initialization['loginOpenIamUseCase'],
      initialization['refreshTokenUseCase'],
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
    List<String>? populate,
    bool? count,
    List<Map<String, String>>? filters,
    List<String>? fields,
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
      populate,
      count,
      filters,
      fields,
    );
  }

  Future<dynamic> getMany(
    String endPoint,
    List<Map<String, dynamic>> entities,
    String environment,
  ) {
    return getManyUsecase(
      endPoint,
      entities,
      environment,
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

  Future<dynamic> getDistinct(
    String entityId, {
    dynamic cacheExpiration,
    dynamic cacheKey,
    bool? count,
    List<String>? fields,
    List<Map<String, dynamic>>? filter,
    List<String>? distinct,
    List<Map<String, dynamic>>? sortBy,
  }) {
    return getDistinctUsecase(
      entityId,
      cacheExpiration,
      cacheKey,
      count,
      fields,
      filter,
      distinct,
      sortBy,
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
    String? environment,
    Map<String, String>? customHeaders,
  }) {
    return loginEmailUsecase(
      emailAddress,
      password,
      apiKey,
      rememberMe: remenberMe,
      environment: environment,
      customHeaders: customHeaders,
    );
  }

  Future<dynamic> loginWithGoogle(
    String apiKey,
    String token, {
    String? environment,
    Map<String, String>? customHeaders,
  }) {
    return loginGoogleUsecase(
      apiKey,
      token,
      environment: environment,
      customHeaders: customHeaders,
    );
  }

  Future<dynamic> loginWithFacebook(
    String apiKey,
    String token, {
    String? environment,
    Map<String, String>? customHeaders,
  }) {
    return loginFacebookUsecase(
      apiKey,
      token,
      environment: environment,
      customHeaders: customHeaders,
    );
  }

  Future<dynamic> loginWithOpenIam(
    String? endPoint,
    String apiKey,
    String code,
    String redirectUrl, {
    String? environment,
    bool? rememberMe,
    List<String>? otherData,
  }) {
    return loginOpenIamUseCase(
      apiKey,
      code,
      redirectUrl,
      environment: environment,
      rememberMe: rememberMe,
      otherData: otherData,
    );
  }

  Future<dynamic> refreshToken(
    String refreshToken, {
    List<String>? otherData,
  }) {
    return refreshTokenUseCase(
      refreshToken,
      otherData,
    );
  }
}
