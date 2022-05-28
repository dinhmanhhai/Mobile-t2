import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/route_manager.dart';
import 'package:mobile/app/model/note.dart';
import 'package:mobile/app/pages/details/details_view.dart';
import 'package:mobile/app/pages/home/providers/home_provider.dart';
import 'package:mobile/app/routers/app_pages.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BuildContext context;
  bool gridView = false;
  NoteUser? noteUser;
  final HomeProvider _homeProvider = HomeProvider();

  HomeCubit(this.context) : super(const HomeInitial()){
    getListNotes();
    emit(const ListTileView());
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

  Future<bool> getListNotes() async {
    try{
      emit(const FetchingNotes());
      Response response = await _homeProvider.listNotes();
      if(response.data?['status'] == true){
        noteUser = NoteUser.fromJson(response.data);
        emit(const ListTileView());
        return true;
      }
      return false;
    } catch (e){
      return false;
    }
  }

  void navigator(int index) {
    Get.to(() => DetailsView());
  }
}
