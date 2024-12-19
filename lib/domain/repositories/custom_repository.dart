abstract class CustomRepository {
  Future<dynamic> get(
    String endpoint,
    List<int>? ids,
    int? size,
    int? page,
    Map<String, int>? sort,
    bool? all, {
    Map<String, dynamic>? filter,
  });
}
