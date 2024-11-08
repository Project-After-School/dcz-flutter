import 'package:dcz/core/di/base_url.dart';
import 'package:dcz/data/data_sources/secure_storage_data_source.dart';
import 'package:dio/dio.dart';

Future<List<Map<String, String>>> fetchNotifications(int skip, int limit) async {
  Dio dio = Dio();
  final authRepository = AuthRepository();

  try {
    String? token = await authRepository.getToken();

    if (token == null) {
      throw Exception("No token found");
    }

    final response = await dio.get(
      '$BaseUrl/get_notification_all',
      options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          }
      ),
      queryParameters: {
        'skip': skip,
        'limit': limit,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => {
        'title': item['title'] as String,
        'date': item['date'] as String,
      }).toList();
    } else {
      throw Exception("Failed to load notifications");
    }
  } catch (e) {
    print("$e");
    return [];
  }
}
