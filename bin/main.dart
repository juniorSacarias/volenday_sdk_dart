import 'package:volenday_sdk_dart/volenday_sdk_dart.dart';

void main() async {
  try {
    // Ruta al archivo .env
    const envFilePath = '.env';

    // Token proporcionado directamente
    //const token = '';

    // Definir el entorno actual (cambiar a 'test' o 'prod' según el caso)
    const environment = 'dev';

    // Crear una instancia del SDK usando envFilePath
    final sdk = await VolendaySdkDart.create(
      environment: environment,
      envFilePath: envFilePath,
      //token: token,
    );

    print('SDK initialized successfully.');

    const entityId = '_inputNumber';
    const collection = '';
    const data = [{"Number1": "1", "Id": 4}];
    const endPoint = '/api/e/_inputNumber';
    const emailAddress = "junior.sacarias.garcia.diaz@volenday.com";
    const password = 'ZFs-o5';
    const apiKey = '';

    final response = await sdk.postMany(
      entityId,
      data,
    );
    /*final response = await sdk.loginWithEmail(
      'api/auth/email',
      emailAddress, 
      password,
      apiKey,
    );*/
    //print('get response: $get');
    print('Response received: $response');
  } catch (e) {
    print('Error running the application: $e');
  }
}
