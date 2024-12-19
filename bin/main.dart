import 'package:volenday_sdk_dart/volenday_sdk_dart.dart';

void main() async {
  try {
    // Ruta al archivo .env
    const envFilePath = '.env';

    // Token proporcionado directamente
    //const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlLZXkiOiIzMjQ3NjY0ZS1iODRiLTQ5OTAtOThmNC1kNjFiNTFiYTA1NDQiLCJhcHBsaWNhdGlvbiI6eyJJZCI6IjI3YzhlYjIwLThlNDEtMTFlYy04YTU5LTY3MDE1Njk5MWRlNiIsIlNjaGVtYU5hbWUiOiIyN2M4ZWIyMC04ZTQxLTExZWMtOGE1OS02NzAxNTY5OTFkZTYifSwiYWNjb3VudCI6eyJQZXJzb25JZCI6NjUsIlVzZXJJZCI6NjZ9LCJleHBpcmF0aW9uIjoiMWgiLCJpYXQiOjE3MzQ2MTg2ODksImV4cCI6MTczNDYyMjI4OX0.BcAvb-3aQTH_o73G-c7rh0N-rElrYXe1IBt1YZdyyQM';

    // Definir el entorno actual (cambiar a 'test' o 'prod' según el caso)
    const environment = 'dev';

    // Crear una instancia del SDK usando envFilePath
    final sdk = await VolendaySdkDart.create(
      environment: environment,
      envFilePath: envFilePath,
      //token: token,
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