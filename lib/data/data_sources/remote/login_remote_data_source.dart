import 'package:dcz/core/di/base_url.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> postLoginInfo(String username, String password) async {
  dio.Dio dioInstance = dio.Dio();

  dio.FormData formData = dio.FormData.fromMap({
    "username": username,
    "password": password,
  });

  try {
    final response = await dioInstance.post(
      "$BaseUrl/user/login",
      options: dio.Options(
        headers: {
          "Content-Type": "multipart/form-data",
        },
      ),
      data: formData,
    );

    print(response.data);

    if (response.statusCode == 200) {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'accessTokenKey', value: response.data['access_token']);
      await storage.write(key: 'tokenType', value: response.data['token_type']);
    }
  } catch (e) {
    throw Exception('Failed to post login info: $e');
  }
}
