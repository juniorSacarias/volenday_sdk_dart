import 'package:volenday_sdk_dart/core/config/config.dart';

class SdkConfig {
  static Future<Map<String, dynamic>> loadConfig({
    required String environment,
    String? envFilePath,
    String? token,
  }) async {
    await Config.load(
      environment: environment,
      envFilePath: envFilePath,
      token: token,
    );

    final currentEnvironment = Config.currentEnvironment;
    final baseUrl = currentEnvironment['baseUrl'];
    final finalToken = Config.token;

    return {
      'baseUrl': baseUrl,
      'token': finalToken,
    };
  }
}