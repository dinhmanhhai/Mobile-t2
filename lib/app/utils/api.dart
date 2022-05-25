import 'dart:async';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:mobile/app/data/network/network.dart';

import 'application.dart';

class API {
  static String baseUrl = Platform.isIOS ? ConnectToServer.baseUrlIos : ConnectToServer.baseUrlAndroid;
  static final Dio dio = Dio(
    BaseOptions(
      connectTimeout: 30000,
      sendTimeout: 60000,
      receiveTimeout: 30000,
      contentType: 'application/json; charset=utf-8',
      baseUrl: baseUrl,
    ),
  );

  API() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (Application.sharePreference!.hasKey("token")) {
            options.headers["token"] = "${Application.sharePreference!.getString("token")}";
          }
          print("token: ${Application.sharePreference?.getString("token")}");
          print(options.uri);
          return handler.next(options); //continue
        },
        onResponse: (response, handler) async {
          return handler.next(response); // continue
        },
        onError: (e, handler) async {
          _handleTimeOutException(e.type);
          var response = e.response ?? Response(requestOptions: e.requestOptions);
          return handler.resolve(response); //continue
        },
      ),
    );
  }

  void _handleTimeOutException(DioErrorType type) {
    switch (type) {
      case DioErrorType.connectTimeout:
        break;
      case DioErrorType.sendTimeout:
        break;
      case DioErrorType.receiveTimeout:
        break;
      case DioErrorType.other:
        break;
      default:
        break;
    }
  }
}
