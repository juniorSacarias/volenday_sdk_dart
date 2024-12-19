abstract class CustomRepository {
  Future<dynamic> get(
    String endpoint,
    List<int>? ids,
    int? size,
    int? page, 
    Map<String, int>? sort, {
    Map<String, dynamic>? filter,
  });
}
