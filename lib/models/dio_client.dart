import 'dart:io';

import 'package:cobranza/utils/sp_util.dart';
import 'package:cobranza/utils/string_util.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioClient {
  static const BASE_API = "http://192.168.100.42:3000/api";
  static const REQUEST_MEDIA_TYPE = "application";
  static const REQUEST_MEDIA_SUB_TYPE = "json";
  static const CONTENT_TYPE = "$REQUEST_MEDIA_TYPE/$REQUEST_MEDIA_SUB_TYPE";
  static const DEFAULT_CHARSET = "UTF-8";
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: BASE_API,
    connectTimeout: 30000,
    receiveTimeout: 20000,
    headers: {"Content-Type": CONTENT_TYPE},
  );

  Dio _dio = new Dio(baseOptions);

  static final DioClient _dioClient = DioClient._internal();

  Dio get dio => _dio;

  factory DioClient() {
    return _dioClient;
  }

  DioClient._internal() {
    setProxy("192.168.100.42", 3000);

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (Options options) async {
      if (!options.headers.containsKey('Authorization') ||
          (options.headers['Authorization'] as String).isEmpty) {
        String basic = SpUtil.getGitHubAuthorizationBasic();
        if (StringUtil.isNotEmpty(basic)) {
          options.headers['Authorization'] = basic;
        }
      }
      return options;
    }));
  }

  void setProxy(String proxyServer, int port) {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        return "PROXY $proxyServer:$port";
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }
}

DioClient dioClient = DioClient();
