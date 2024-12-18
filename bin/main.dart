import 'package:volenday_sdk_dart/volenday_sdk_dart.dart';

void main() async {
  try {
    // Ruta al archivo .env
    const envFilePath = '.env';

    // Definir el entorno actual (cambiar a 'test' o 'prod' según el caso)
    const environment = 'dev';

    // Crear una instancia del SDK
    final sdk = await VolendaySdkDart.create(
      environment: environment,
      envFilePath: envFilePath,
    );

    print('SDK initialized successfully.');

    // Hacer una solicitud GET a un endpoint
    const endpoint = '/api/e/Departments'; // Cambia esto a tu endpoint real

    print('Making GET request to endpoint: $endpoint');
    final response = await sdk.get(
      endpoint,
      ids: [1, 2, 3],
    );
    print('Response received: $response');
  } catch (e) {
    print('Error running the application: $e');
  }
}
