abstract class GetRepository {
  Future<dynamic> get(
    String endpoint,
    List<int>? ids,
    int? size,
    int? page,
    Map<String, int>? sort,
    bool? all,
    String? keywords,
    bool? autoPopulate,
    bool? count,
    List<Map<String, String>>? filters,
  );
}
