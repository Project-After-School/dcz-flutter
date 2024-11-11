import 'package:dcz/core/di/base_url.dart';
import 'package:dcz/data/data_sources/secure_storage_data_source.dart';
import 'package:dio/dio.dart';

Future<Map<String, dynamic>> getUserInfo() async {
  Dio dio = Dio();
  final authRepository = AuthRepository();

  try {
    String? token = await authRepository.getToken();
    if (token == null) {
      throw Exception("No token found");
    }

    final response = await dio.get(
      '$BaseUrl/get_user_mypage',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception("Failed to load user info");
    }
  } catch (e) {
    rethrow;
  }
}
