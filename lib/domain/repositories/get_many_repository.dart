abstract class GetManyRepository {
  Future<dynamic> getMany(
    String endPoint,
    List<Map<String, dynamic>> entities,
    String environment,
  );
}
