import 'package:mobile/app/data/network/network.dart';
import 'package:mobile/app/utils/api.dart';
import 'package:mobile/app/utils/application.dart';

class DetailsProvider {
  Future<dynamic> createNote(Map<String, dynamic> params) async {
    return API.dio.post(ConnectToServer.createNote, data: params);
  }
  Future<dynamic> rewriteNote(Map<String, dynamic> params) async {
    String url = ConnectToServer.rewriteNote.replaceFirst('{id}', params['id'].toString());
    return API.dio.post(url, data: params);
  }
  Future<dynamic> deleteNote(int id) async {
    String url = ConnectToServer.deleteNote.replaceFirst('{id}', id.toString());
    return API.dio.post(url);
  }
}
