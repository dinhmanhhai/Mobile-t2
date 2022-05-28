import 'package:mobile/app/data/network/network.dart';
import 'package:mobile/app/utils/api.dart';
import 'package:mobile/app/utils/application.dart';

class HomeProvider {
  static Future<dynamic> listNotes() async {
    return API.dio.get(ConnectToServer.listNotes);
  }
  static Future<dynamic> getUserInfo() async {
    return API.dio.get(ConnectToServer.userInfo);
  }
}
