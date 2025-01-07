abstract class GetDistinctRepository {
  Future<dynamic> getDistinct(
    String entityId,
    dynamic cacheExpiration,
    dynamic cacheKey,
    bool? count,
    List<String>? fields,
    List<Map<String, dynamic>>? filter,
    List<String>? distinct,
    List<Map<String, dynamic>>? sortBy,
  );
}
