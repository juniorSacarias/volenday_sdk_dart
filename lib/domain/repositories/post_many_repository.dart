abstract class PostManyRepository {
  Future<dynamic> postMany(
    String entityId,
    List<Map<String, dynamic>> data,
  );
}
