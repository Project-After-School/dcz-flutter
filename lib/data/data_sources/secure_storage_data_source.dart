import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }
  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }
  Future<void> deleteToken() async {
    await _storage.delete(key: 'auth_token');
  }
}
