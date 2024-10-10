import 'dart:developer';

import 'package:feasto/data/local/session_controller.dart';
import 'package:feasto/data/network/network_api_services.dart';
import 'package:feasto/features/auth/repo/auth_repository_impl.dart';

import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final _authRepository = AuthRepositoryImpl(NetworkApiService());

  //getter
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get rePasswordController => _rePasswordController;
  TextEditingController get nameController => _nameController;
  String get authScreen => _authScreen;

  //setter
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _rePasswordController;
  late TextEditingController _nameController;
  String _authScreen = "signin";

  void authScreenSet(String screen) {
    _authScreen = screen;
    notifyListeners();
  }

  void initlization() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
    _nameController = TextEditingController();
  }

  Future<void> signIn() async {
    final userSession = SessionController().user;
    try {
      final result = await _authRepository.signIn(
          email: _emailController.text, password: _passwordController.text);

      if (result != null) {
        SessionController().saveUserSession(result);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void disposeViewModel() {
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _nameController.dispose();
  }
}
