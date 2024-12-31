import 'package:volenday_sdk_dart/domain/repositories/refreshtoken_repository.dart';
import 'package:volenday_sdk_dart/infraestructure/datasources/http_refreshtoken_datasource.dart';

class RefreshtokenRepositoryImpl implements RefreshtokenRepository {
  final HttpRefreshtokenDatasource refreshtokenDatasource;

  RefreshtokenRepositoryImpl(this.refreshtokenDatasource);

  @override
  Future<dynamic> refreshToken(
    String refreshToken,
    List<String>? otherData,
  ) {
    return refreshtokenDatasource.refreshToken(
      refreshToken,
      otherData: otherData,
    );
  }
}
