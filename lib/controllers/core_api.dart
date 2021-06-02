// Cookie Login Solution based on https://stackoverflow.com/questions/52241089/how-do-i-make-an-http-request-using-cookies-on-flutter
import "package:dio/dio.dart";
import 'package:get/get.dart' as getx;

class COREApi extends getx.GetxController {
  static const String API_URL = "http://192.168.1.100:8080";

  Map<String, String> headers = {};
  Map<String, String> cookies = {};

  final Dio _client = Dio(
    BaseOptions(baseUrl: API_URL),
  );

  void _updateCookie(Response<dynamic> response) {
    String allSetCookie = response.headers.value("set-cookie");

    if (allSetCookie != null) {
      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      headers['cookie'] = _generateCookieHeader();
    }
    _client.options.headers = headers;
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.length > 0) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires') return;

        this.cookies[key] = value;
      }
    }
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.length > 0) cookie += ";";
      cookie += key + "=" + cookies[key];
    }

    return cookie;
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
  }) async {
    final res = await _client.get<T>(path, queryParameters: queryParameters);
    _updateCookie(res);
    return res;
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
  }) async {
    final res = await _client.post<T>(path,
        data: data, queryParameters: queryParameters);
    _updateCookie(res);
    return res;
  }
}
