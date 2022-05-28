import 'package:mobile/app/data/network/network.dart';
import 'package:mobile/app/utils/api.dart';
import 'package:mobile/app/utils/application.dart';

class HomeProvider {
  Future<dynamic> listNotes() async {
    return API.dio.get(ConnectToServer.listNotes);
  }
}
