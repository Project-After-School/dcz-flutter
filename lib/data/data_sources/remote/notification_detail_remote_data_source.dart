import 'package:dcz/core/di/base_url.dart';
import 'package:dcz/data/data_sources/secure_storage_data_source.dart';
import 'package:dio/dio.dart';

Future<List<Map<String, String>>> getNotificationsDetail(String notificationTitle) async {
  Dio dio = Dio();
  final authRepository = AuthRepository();

  try {
    String? token = await authRepository.getToken();
    print(token);
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
        'notification_title': notificationTitle,
      },
    );

    print("Response status: ${response.statusCode}");
    print("Response: ${response.data}");

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => {
        'title': item['title'] as String,
        'content': item['content'] as String,
        'author_name': item['author_name'] as String,
        'date': item['date'] as String,
      }).toList();
    } else {
      throw Exception("Failed to load notifications");
    }
  } catch (e) {
    print("Error: $e");
    return [];
  }
}
