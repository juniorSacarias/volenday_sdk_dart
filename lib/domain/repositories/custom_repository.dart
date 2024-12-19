abstract class CustomRepository {
  Future<dynamic> get(
    String endpoint,
    List<int>? ids,
    int? size,{
    Map<String, dynamic>? filter,
  });
}
