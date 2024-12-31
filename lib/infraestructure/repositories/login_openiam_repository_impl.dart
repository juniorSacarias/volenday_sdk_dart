import 'package:volenday_sdk_dart/domain/repositories/login_openiam_repository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_login_openIAM_datasource.dart';

class LoginOpeniamRepositoryImpl implements LoginOpeniamRepository {
  final HttpLoginOpeniamDatasource loginOpeniamDatasource;

  LoginOpeniamRepositoryImpl(this.loginOpeniamDatasource);

  @override
  Future<dynamic> loginOpenIam(
    String apiKey,
    String code,
    String redirectUrl,
    String? environment,
    bool? remenberMe,
    List<String>? otherData,
  ) {
    return loginOpeniamDatasource.loginWithOpenIAM(
      apiKey,
      code,
      redirectUrl,
      environment,
      remenberMe,
      otherData,
    );
  }
}
