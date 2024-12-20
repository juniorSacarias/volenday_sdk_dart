abstract class PostRespository {
  Future<dynamic> post(
    String endpoint,
    bool? autoPopulate,
    Map<String, dynamic> data,
  );
}