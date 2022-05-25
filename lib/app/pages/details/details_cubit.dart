import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<Details> {
  final BuildContext context;
  bool gridView = false;
  late Response result;

  DetailsCubit(this.context) : super(const HomeInitial()){
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
}
