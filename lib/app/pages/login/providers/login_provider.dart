import 'package:mobile/app/data/network/network.dart';
import 'package:mobile/app/utils/api.dart';
import 'package:mobile/app/utils/application.dart';

class LoginProvider {
  static Future<dynamic> login(Map<String, dynamic> params) async {
    print("=================");
    return API.dio.get(ConnectToServer.login, queryParameters: params);
  }
}
