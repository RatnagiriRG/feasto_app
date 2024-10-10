class AppUrls {
  static const String baseURL = "http://192.168.1.5:8000";

  //auth
  static const _client = "/api/client";
  static const _auth = "/api/auth";
  static const String login = "$_client/login";
  static const String refreshToken = "$_client/refresh-token";
  static const String logout = "$_client/";
  static const String create = "$_auth/register";
}
