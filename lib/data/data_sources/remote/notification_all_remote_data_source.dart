import 'package:dcz/core/di/base_url.dart';
import 'package:dio/dio.dart';

Future<List<dynamic>> getNotificationAll(int skip, int limit) async {
  Dio dio = Dio();

  Map<String, dynamic> queryParams = {
    "skip": skip,
    "limit": limit,
  };

  try {
    final response = await dio.get(
      "$BaseUrl/get_notification_all",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          //"Authorization" : "Bearer $accessToken"
        },
      ),
      queryParameters: queryParams,
    );

    print("Response data: ${response.data}");

    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      return [];
    }
  } catch (e) {
    print("Error: $e");
    return [];
  }
}
