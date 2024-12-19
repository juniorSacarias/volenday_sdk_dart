abstract class PostRespository {
  Future<dynamic> post(
    String endpoint,
    Map<String, dynamic> data,
  );
}