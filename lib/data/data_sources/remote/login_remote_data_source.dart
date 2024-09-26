import 'dart:convert';
import 'package:dcz/core/di/base_url.dart';
import 'package:dio/dio.dart';

Future<bool> postLoginInfo(String accountId, String password) async {
  Dio dio = Dio();

  Map<String, dynamic> data = {
    "account_id": accountId,
    "password": password,
  };

  try {
    final response = await dio.post(
      "$BaseUrl/user/login",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: jsonEncode(data),
    );

    print('Response status: ${response.statusCode}');
    print('Response data: ${response.data}');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(response.data);
    }
  } catch (e) {
    if (e is DioException && e.response?.statusCode == 500) {
      throw Exception('다시 확인해주세요.');
    } else {
      throw Exception('다시 확인해주세요');
    }
  }
}
