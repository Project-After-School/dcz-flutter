import 'package:dcz/core/di/base_url.dart';
import 'package:dcz/data/data_sources/secure_storage_data_source.dart';
import 'package:dio/dio.dart';

Future<Map<String, String>> getNotificationsDetail(String notificationId) async {
  Dio dio = Dio();
  final authRepository = AuthRepository();

  try {
    if (notificationId.isEmpty) {
      throw Exception("Notification ID is empty");
    }

    String? token = await authRepository.getToken();
    print("Full request URL: ${BaseUrl}/get_notification_detail?notification_id=$notificationId");
    print("Token: $token");

    if (token == null) {
      throw Exception("No token found");
    }

    final response = await dio.get(
      '$BaseUrl/get_notification_detail',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      queryParameters: {
        'notification_id': notificationId,
      },
    );

    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200) {
      // 수정: 단일 알림의 세부 정보를 Map으로 반환
      Map<String, dynamic> data = response.data;
      return {
        'title': data['title'] as String,
        'content': data['content'] as String,
        'author_name': data['author_name'] as String,
        'date': data['date'] as String,
      };
    } else {
      throw Exception("Failed to load notifications, status code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
    return {};
  }
}
