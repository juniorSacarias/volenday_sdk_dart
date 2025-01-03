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
    List<String>? populate,
    bool? count,
    List<Map<String, String>>? filters,
    List<String>? fields,
  );
}
