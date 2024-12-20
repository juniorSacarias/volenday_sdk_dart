abstract class LoginEmailRespository {
  Future<dynamic> loginWithEmail(
    String emailAddress,
    String password,
    String apiKey,
  );
}