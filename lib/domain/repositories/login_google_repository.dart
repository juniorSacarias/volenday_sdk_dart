abstract class LoginGoogleRepository {
  Future<dynamic> loginWithGoogle(
    String apiKey,
    String token,
    String? environment,
    Map<String, String>? customHeaders,
  );
}