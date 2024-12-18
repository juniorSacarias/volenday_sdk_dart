abstract class CustomRepository {
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? filter});
}
