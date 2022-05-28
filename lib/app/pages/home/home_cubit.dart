import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/route_manager.dart';
import 'package:mobile/app/config/toast/toast_config.dart';
import 'package:mobile/app/data/i18n/i18n.dart';
import 'package:mobile/app/model/note.dart';
import 'package:mobile/app/pages/details/details_view.dart';
import 'package:mobile/app/pages/home/providers/home_provider.dart';
import 'package:mobile/app/routers/app_pages.dart';
import 'package:mobile/app/utils/application.dart';
import 'package:mobile/app/utils/toast.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BuildContext context;
  bool gridView = false;
  NoteUserResponse? noteUser;

  HomeCubit(this.context) : super(const HomeInitial()){
    getListNotesAndUserInfo();
  }

  void changeView(){
    emit(const ChangeView());
    gridView = !gridView;
    if(!gridView) {
      emit(const ListTileView());
    } else {
      emit(const GridTileView());
    }
    Get.back();
  }

  Future<bool> getListNotesAndUserInfo() async {
    try{
      emit(const FetchingNotes());
      Response response = await HomeProvider.listNotes();
      Response res = await HomeProvider.getUserInfo();
      Application.displayName = res.data?['data']?['displayName'] ?? '';
      if(response.data?['status'] == true){
        noteUser = NoteUserResponse.fromJson(response.data);
        emit(const ListTileView());
        return true;
      }
      Toastify.showToast(ToastState.failure, "Network Exception".i18n, context);
      return false;
    } catch (e){
      Toastify.showToast(ToastState.failure, "Network Exception".i18n, context);
      return false;
    }
  }

  void navigator(int? index) async {
    if(index != null){
      bool? res = await Get.to(() => DetailsView(data: noteUser?.data![index]));
      if(res == true){
        getListNotesAndUserInfo();
      }
    } else {
      bool? res = await Get.to(() => DetailsView());
      if(res == true){
        getListNotesAndUserInfo();
      }
    }
  }
}
