abstract class LoginFacebookRepository {
  Future<dynamic> loginWithFacebook(
    String apiKey,
    String token,
    String? environment,
    Map<String, String>? customHeaders,
  );
}