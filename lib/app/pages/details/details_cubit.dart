import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile/app/pages/details/providers/home_provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final GlobalKey<FormBuilderState> noteCreate = GlobalKey<FormBuilderState>();
  final DetailsProvider _detailsProvider = DetailsProvider();
  final BuildContext context;

  DetailsCubit(this.context) : super(const DetailsInitial());

  Future<bool> saveNote() async {
    try{
      emit(const Uploading());
      Response response = await _detailsProvider.createNote(noteCreate.currentState?.value ?? {});
      if(response.data?['status'] == true){
        return true;
      }
      emit(const DetailsInitial());
      return false;
    } catch(e){
      emit(const DetailsInitial());
      return false;
    }
  }

  void createNote() {
    if(noteCreate.currentState?.saveAndValidate() == true){
      saveNote();
    }
  }
}
