import 'dart:convert';
import 'dart:developer';
import 'package:feasto/features/auth/model/user_session_model.dart';
import 'package:feasto/data/local/local_storage.dart';

class SessionController {
  static final _instance = SessionController._internal();
  factory SessionController() => _instance;

  final LocalStorage _localStorage = LocalStorage();

  bool? isLogin;
  UserSessionData user = const UserSessionData();
  SessionController._internal() {
    isLogin = false;
  }

  Future<void> saveUserSession(UserSessionData user) async {
    _localStorage.setValue("tokens", jsonEncode(user));
    _localStorage.setValue("isLogin", "true");
    SessionController().user = user;
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await _localStorage.readValue('tokens');
      var isLogin = await _localStorage.readValue('isLogin');

      if (userData is String && userData.isNotEmpty) {
        SessionController().user =
            UserSessionData.fromJson(jsonDecode(userData));
        if (SessionController().user.accessToken != null) {
          log("Authentication Token present");
        }
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> clearLocalData() async {
    user = const UserSessionData();
    isLogin = null;
    await _localStorage.clearAllValue();
  }
}
