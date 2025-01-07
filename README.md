# VolendaySDK - Dart

![ahastudioLogo](https://github.com/user-attachments/assets/51f405c7-a81a-4dd7-af14-973b3521aea2)

**Author**: [Junior Sacarias](https://github.com/juniorSacarias)

---

## 📖 Introduction

VolendaySDK - Dart was born as a fork of VolendaySDK which is exclusive for javascript. This library allows us to make http requests in dart quickly and efficiently by adding different methods that facilitate the development work in Dart and Flutter projects.

---

## Configuration

  In order to use the library we only need a simple step to obtain an SDK ready for use.
  
  1. Create an instance
     Inside the file of your choice we must create an instance of the VolendarSDKDart.create module which receives two parameters:
     
       a. token => jwt token of auth ( opcional )
     
       b. envFilePath => path to .env for take the token ( optional )
     
       c. environment => string to determinate the environment ej: 'env', 'test' ( required )

    Type Schema:
    
      required String environment,
      String? envFilePath,
      String? token,

    Example: 
    // Set the intance of VolendaySDK-Dart
    final sdk = await VolendaySdkDart.create(
      environment: environment,
      envFilePath: envFilePath,
      token: token,
    );
    
  2. Select the mehod:
     This librarie have mehod for basic CRUD and AUTH

     a. Auth Login with local account:
     ```
       Type Schema:
     
          required String apiKey,
          required String enailAddress,
          required String password,
          bool? remenberMe,
          String? environment,
          Map<String, String>? customHeaders,
     
        Example: 

        final response = await sdk.loginEmailUsecase(
          emailAddress,
          password,
          apiKey,
          rememberMe: true,
          environment: 'env',
          customHeaders: {
            'X-Api-Key': apiKey, <= this is only a example
          },
        );
     ```   
  b. Auth Login with Google:
  
      ```
       Type Schema:
     
          required String apiKey,
          required String token,
          String? environment,
          Map<String, String>? customHeaders,
     
        Example: 

        final response = await sdk.loginWithGoogle(
          apiKey,
          token,
          environment: 'env',
          customHeaders: {
            'X-Api-Key': apiKey, <= this is only a example
          },
        );
     ``` 
  c. Auth Login with Facebook:
  
     ```
       Type Schema:
     
          required String apiKey,
          required String token,
          String? environment,
          Map<String, String>? customHeaders,
     
        Example: 

        final response = await sdk.loginWithFacebook(
          apiKey,
          token,
          environment: 'env',
          customHeaders: {
            'X-Api-Key': apiKey, <= this is only a example
          },
        );
     ``` 
  d. Auth Login with OpenIAM:
  
       ```
       Type Schema:
     
          required String apiKey,
          required String code,
          required String redirectUrl,
          bool? remenberMe,
          List<String>? otherData,
          String? environment,
          String? endPoint
     
        Example: 

        final response = await sdk.loginWithOpenIam(
          apiKey,
          code,
          redirectUrl,
          environment: 'dev',
          rememberMe: true,
          otherData: ['otherData'],
        );
     ``` 
  e. Mehod GET

    ```
    Type Schema:
      
      required String endPoint;
      int? ids;
      int? size;
      int? page;
      int? sort;
      bool? autoPopulate
      bool? count;
      String? filters

      final response = await sdk.get(
          endPoint,
          ids: ids,
          size: size,
          page: page,
          sort: sort,
          autoPopulate: false / true,
          count; false / true,
          filters: filters,
        );
    ```
  f. Method Post

   ```
    Type Schema:
      required String endPoint;
      bool? autoPopulate;
      required Map<String, dynamic> data;

      final response = await sdk.post(
          endPoint,
          autoPopulate: false / true,
          body: data
        );
   ```
  g. Method Put by Id
  ```
   Type Schema:
      required String endPoint;
      required int id;
      bool? autoPopulate;
      required Map<String, dynamic> data;

      final response = await sdk.put(
          endPoint,
          id: id,
          autoPopulate: false / true,
          body: data,
        );
  ```
  h. Method Delete
  ```
   Type Schema:
      required String endPoint;
      required int id;
      bool? autoPopulate;
      required Map<String, dynamic> data;

      final response = await sdk.delete(
          endPoint,
          id: id,
        );
  ```
---

## 🛠️ Libraries Used

This project uses the following key libraries to ensure quality and performance:

- **[http](https://pub.dev/packages/http)**
- **[dotenv](https://pub.dev/packages/dotenv)**
---

## 🚀 Features for V.0.1.0
In this version I have included the basic functions to start with MVP testing.

Still to be included are:
  CreateMany
  DeleteMany
  Export
  GetCookie
  GetDistinct
  GetMany
  LoginIntoAppCreator
  LoginWithTheMailVerify
  UpdateMany
  VerifyAppWithId
  VerifyAppWithURL
  VerifyToken
