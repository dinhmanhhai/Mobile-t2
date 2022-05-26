import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final BuildContext context;

  DetailsCubit(this.context) : super(const DetailsInitial());

  Future<bool> saveNote() async {
    try{
      emit(const Uploading());
      return false;
    } catch(e){
      emit(const DetailsInitial());
      return false;
    }
  }
}
