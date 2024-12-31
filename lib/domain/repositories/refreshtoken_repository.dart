abstract class RefreshtokenRepository {
  Future<dynamic> refreshToken(
    String refreshToken,
    List<String>? otherData,
  );
}
