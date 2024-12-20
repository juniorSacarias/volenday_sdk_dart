abstract class PutRepository {
  Future<dynamic> put(
    String endpoint,
    int id,
    Map<String, dynamic> data,
  );
}