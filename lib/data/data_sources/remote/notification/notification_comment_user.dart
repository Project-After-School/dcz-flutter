import 'dart:convert';
import 'package:dcz/core/di/base_url.dart';
import 'package:dcz/data/data_sources/secure_storage_data_source.dart';
import 'package:dio/dio.dart';

Future<Map<String, String>> postNotificationComment(String notificationId, String content) async {
  Dio dio = Dio();
  final authRepository = AuthRepository();

  try {
    String? token = await authRepository.getToken();

    Map<String, dynamic> data = {
      "content": content,
    };

    final response = await dio.post(
      '$BaseUrl/user/notifications/$notificationId/comments',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      data: jsonEncode(data),
    );

    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200) {
      return {'status': 'success'};
    } else {
      throw Exception("status code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
    return {};
  }
}
