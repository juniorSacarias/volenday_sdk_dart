abstract class CustomRepository {
  Future<dynamic> get(
    String endpoint,
    List<int>? ids,
    int? size,
    int? page,
    Map<String, int>? sort,
    bool? all, 
    String? keywords, {
    Map<String, dynamic>? filter,
  });
}
