import 'package:dcz/core/di/base_url.dart';
import 'package:dio/dio.dart';

Future<void> postLoginInfo(String username, String password) async {
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

    if (response.statusCode != 200) {
      throw Exception(response.data);
    }
  } catch (e) {
    throw Exception('Failed to post login info: $e');
  }
}
