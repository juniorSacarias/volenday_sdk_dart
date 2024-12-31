import 'package:volenday_sdk_dart/application/usecases/refreshtoken_usecase.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_get_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_login_email_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_login_facebook_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_login_google_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_login_openIAM_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_post_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_put_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_delete_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_refreshtoken_datasource.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/get_repository_impl.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/login_email_repository_impl.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/login_facebook_repository_impl.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/login_google_respository_impl.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/login_openiam_repository_impl.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/post_repository_impl.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/put_repository_impl.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/delete_repository_impl.dart';
import 'package:volenday_sdk_dart/application/usecases/delete_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/get_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/post_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/put_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/login_email_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/login_facebook_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/login_google_usecase.dart';
import 'package:volenday_sdk_dart/application/usecases/login_openiam_usecase.dart';
import 'package:volenday_sdk_dart/infraestructure/repositories/refreshtoken_repository_impl.dart';

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

    final loginEmailUseCase = HttpLoginEmailDatasource(
      baseUrl: baseUrl,
    );

    final loginGoogleUsecase = HttpLoginGoogleDatasource(
      baseUrl: baseUrl,
      token: token,
    );

    final loginFacebookUsecase = HttpLoginFacebookDatasource(
      baseUrl: baseUrl,
      token: token,
    );

    final loginOpenIamUseCase = HttpLoginOpeniamDatasource(
      baseUrl: baseUrl,
    );

    final refreshTokenUsecase = HttpRefreshtokenDatasource(
      baseUrl: baseUrl,
      token: token,
    );

    final getRepository = GetRepositoryImpl(getDataSource);
    final postRepository = PostRepositoryImpl(postDataSource);
    final putRepository = PutRepositoryImpl(putDataSource);
    final deleteRepository = DeleteRepositoryImpl(deleteDataSource);
    final loginEmailRepository = LoginEmailRepositoryImpl(loginEmailUseCase);
    final loginGoogleRepository =
        LoginGoogleRespositoryImpl(loginGoogleUsecase);
    final loginFacebookRepository =
        LoginFacebookRepositoryImpl(loginFacebookUsecase);
    final loginOpenIamRepository =
        LoginOpeniamRepositoryImpl(loginOpenIamUseCase);
    final refreshTokenRepository =
        RefreshtokenRepositoryImpl(refreshTokenUsecase);

    return {
      'getUseCase': GetUseCase(getRepository),
      'postUseCase': PostUsecase(postRepository),
      'putUseCase': PutUsecase(putRepository),
      'deleteUseCase': DeleteUsecase(deleteRepository),
      'loginEmailUseCase': LoginEmailUsecase(loginEmailRepository),
      'loginGoogleUseCase': LoginGoogleUsecase(loginGoogleRepository),
      'loginFacebookUseCase': LoginFacebookUsecase(loginFacebookRepository),
      'loginOpenIamUseCase': LoginOpeniamUsecase(loginOpenIamRepository),
      'refreshTokenUseCase': RefreshtokenUsecase(refreshTokenRepository),
    };
  }
}
