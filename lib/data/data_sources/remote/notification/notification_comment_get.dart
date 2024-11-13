import 'package:dcz/core/di/base_url.dart';
import 'package:dcz/data/data_sources/secure_storage_data_source.dart';
import 'package:dio/dio.dart';

Future<List<Map<String, String>>> getNotificationComments(String notificationId) async {
  Dio dio = Dio();
  final authRepository = AuthRepository();

  try {
    String? token = await authRepository.getToken();

    final response = await dio.get(
      '$BaseUrl/notifications/$notificationId/comments',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((comment) {
        return {
          'content': comment['content'] as String,
          'author_name' : comment['author_name'] as String
        };
      }).toList();
    } else {
      throw Exception("status code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
    return [];
  }
}
