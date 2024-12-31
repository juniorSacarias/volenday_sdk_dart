abstract class LoginOpeniamRepository {
  Future<dynamic> loginOpenIam(
    String apiKey,
    String code,
    String redirectUrl,
    String? environment,
    bool? remenberMe,
    List<String>? otherData,
  );
}