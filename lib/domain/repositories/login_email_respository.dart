abstract class LoginEmailRespository {
  Future<dynamic> loginWithEmail(
    String emailAddress,
    String password,
    String apiKey,
    bool? remenberMe,
    String? environment,
    Map<String, String>? customHeaders,
  );
}