import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class Api extends GetxController {
  final Dio client;

  Api({@required this.client});

  static Future<Api> createInstance() async {
    final apiUrl = dotenv.env['API_URL'];

    if (apiUrl.isEmpty) throw new Exception('Missing API_URL');

    final client = Dio(
      BaseOptions(baseUrl: apiUrl),
    );

    final cookieStorageDirectory = await getApplicationDocumentsDirectory();
    final _cookieJar = PersistCookieJar(
      storage: FileStorage(cookieStorageDirectory.path),
    );

    client.interceptors.add(CookieManager(_cookieJar));

    return Api(client: client);
  }
}
