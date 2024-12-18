import 'package:dotenv/dotenv.dart' as dotenv;

class EnvManager {
  // Crear una instancia de DotEnv
  static final dotenv.DotEnv _dotenv = dotenv.DotEnv();

  /// Carga las variables desde el archivo .env
  static void loadEnv() {
    // Cargar las variables de entorno desde el archivo .env
    _dotenv.load();
  }

  /// Obtiene el token según el entorno
  static String getToken(String environment) {
    switch (environment) {
      case 'dev':
        return _dotenv['DEV_TOKEN'] ?? '';
      case 'test':
        return _dotenv['TEST_TOKEN'] ?? '';
      case 'prod':
        return _dotenv['PROD_TOKEN'] ?? '';
      default:
        throw Exception('Entorno no válido: $environment');
    }
  }

  /// Lee una variable específica del archivo .env
  static String getEnvVariable(String key) {
    return _dotenv[key] ?? '';
  }
}