import 'package:dcz/core/di/base_url.dart';
import 'package:dio/dio.dart';

Future<String> postLoginInfo(String username, String password) async {
  Dio dio = Dio();

  FormData formData = FormData.fromMap({
    "username": username,
    "password": password,
  });

  try {
    final response = await dio.post(
      "$BaseUrl/user/login",
      options: Options(
        headers: {
          "Content-Type": "multipart/form-data",
        },
      ),
      data: formData,
    );

    if (response.statusCode == 200) {
      print('Server response: ${response.data}');
      String? token = response.data['access_token'];
      if (token == null) {
        throw Exception("Token is null. Please check the server response.");
      }
      return token;
    } else {
      throw Exception("Failed to retrieve token");
    }
  } catch (e) {
      throw Exception('Failed to post login info: $e');
  }
}
