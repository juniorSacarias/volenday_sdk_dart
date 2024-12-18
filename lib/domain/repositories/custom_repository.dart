abstract class CustomRepository {
  Future<dynamic> get(
    String endpoint,
    List<int>? ids, {
    Map<String, dynamic>? filter,
  });
}
