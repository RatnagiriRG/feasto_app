import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionController {
  static final _instance = SessionController._internal();
  factory SessionController() => _instance;
  SessionController._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Keys used to store session information
  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';
  static const String _userIdKey = 'userId';

  Future<void> saveSession(Map<String, dynamic> data) async {
    await _storage.write(key: _accessTokenKey, value: data['token']);
    await _storage.write(key: _refreshTokenKey, value: data['refreshToken']);
    await _storage.write(key: _userIdKey, value: data['userid']);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<void> clearSession() async {
    await _storage.deleteAll();
  }
}
