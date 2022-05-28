import 'package:mobile/app/data/network/network.dart';
import 'package:mobile/app/utils/api.dart';
import 'package:mobile/app/utils/application.dart';

class DetailsProvider {
  Future<dynamic> createNote(Map<String, dynamic> params) async {
    return API.dio.post(ConnectToServer.createNote, data: params);
  }
  Future<dynamic> rewriteNote(Map<String, dynamic> params) async {
    print(params);
    String url = ConnectToServer.rewriteNote.replaceFirst('{id}}', params['id']);
    print(url);
    return API.dio.post(url, data: params);
  }
}
