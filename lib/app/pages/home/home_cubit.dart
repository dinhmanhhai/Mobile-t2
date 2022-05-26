import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:mobile/app/pages/details/details_view.dart';
import 'package:mobile/app/routers/app_pages.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BuildContext context;
  bool gridView = false;

  HomeCubit(this.context) : super(const HomeInitial()){
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
  }

  void navigator(int index) {
    Get.to(() => DetailsView());
  }
}
