import 'package:mobile/app/data/network/network.dart';
import 'package:mobile/app/utils/api.dart';
import 'package:mobile/app/utils/application.dart';

class DetailsProvider {
  Future<dynamic> createNote(Map<String, dynamic> params) async {
    return API.dio.post(ConnectToServer.createNote, data: params);
  }
}
