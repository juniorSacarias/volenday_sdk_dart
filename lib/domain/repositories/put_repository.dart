abstract class PutRepository {
  Future<dynamic> put(
    String endpoint,
    int id,
    bool? autoPopulate,
    Map<String, dynamic> data,
  );
}
