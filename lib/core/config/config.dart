import 'dart:convert';
import 'dart:io';
import 'package:volenday_sdk_dart/core/utils/env_manager.dart';

class Config {
  static late Map<String, dynamic> _environments;
  static late Map<String, dynamic> _currentEnvironment;
  static late String _token;

  // Load the .env file
  static Future<void> load({
    required String environment,
    String? envFilePath,
    String? token,
  }) async {
    // Load the environments from file

    // ignore: unused_local_variable
    final content =
        await File('lib/core/config/environments.json').readAsString();
    _environments = json.decode(content);
    // Set the current environment
    bool environmentFound = false;

    _environments.forEach((key, value) {
      if (value['name'] == environment) {
        _currentEnvironment = value;
        environmentFound = true;
      }
    });

    if (!environmentFound) {
      throw Exception(
          'Environment not found in environments.json: $environment');
    }

    // Load the token from the environment using EnvManager if not provided
    if (token != null && token.isNotEmpty) {
      _token = token;
    } else {
      EnvManager.loadEnv();
      _token = EnvManager.getToken(environment);

      if (_token.isEmpty) {
        throw Exception('Token is required, please set in the .env file');
      }
    }
  }

  // Get the configuration of local environment
  static Map<String, dynamic> get currentEnvironment {
    return _currentEnvironment;
  }

  // Get the token
  static String get token {
    return _token;
  }
}
