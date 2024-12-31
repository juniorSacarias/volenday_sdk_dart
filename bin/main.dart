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

    const endPoint = '/api/auth/email';
    const emailAddress = "junior.sacarias.garcia.diaz@volenday.com";
    const password = 'ZFs-o5';
    const apiKey = '7a03f540-bc87-11ed-940c-6166a78016d6';
    const refreshToken = 'LuiMroLWaPcThD9ooltFfmj4oapcIaLI';
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlLZXkiOiI3YTAzZjU0MC1iYzg3LTExZWQtOTQwYy02MTY2YTc4MDE2ZDYiLCJhcHBsaWNhdGlvbiI6eyJJZCI6IjI3YzhlYjIwLThlNDEtMTFlYy04YTU5LTY3MDE1Njk5MWRlNiIsIlNjaGVtYU5hbWUiOiIyN2M4ZWIyMC04ZTQxLTExZWMtOGE1OS02NzAxNTY5OTFkZTYifSwiYWNjb3VudCI6eyJQZXJzb25JZCI6NjUsIlVzZXJJZCI6NjZ9LCJleHBpcmF0aW9uIjoiMTgwbSIsImlhdCI6MTczNTY2NDAyMiwiZXhwIjoxNzM1Njc0ODIyfQ.7A5llN5o-HwfDBOZXqNAsuJoX4RFUlKJsmJ5_8jwmGw';

    final response = await sdk.refreshToken(token);
    //final response =
        //await sdk.loginWithEmail(endPoint, emailAddress, password, apiKey);

    //print('get response: $get');
    print('Response received: $response');
  } catch (e) {
    print('Error running the application: $e');
  }
}
