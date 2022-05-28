import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/route_manager.dart';
import 'package:mobile/app/config/toast/toast_config.dart';
import 'package:mobile/app/data/i18n/i18n.dart';
import 'package:mobile/app/pages/details/providers/details_provider.dart';
import 'package:mobile/app/utils/toast.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final GlobalKey<FormBuilderState> noteCreate = GlobalKey<FormBuilderState>();
  final DetailsProvider _detailsProvider = DetailsProvider();
  final BuildContext context;

  DetailsCubit(this.context) : super(const DetailsInitial());

  Future<bool> saveNote(int? updateNoteId) async {
    try {
      emit(const Uploading());
      late Response response;
      if (updateNoteId != null) {
        Map<String, dynamic> params = {
          'id': updateNoteId,
        };
        params.addAll(noteCreate.currentState?.value ?? {});
        response = await _detailsProvider.rewriteNote(params);
        print(response);
      } else {
        response = await _detailsProvider.createNote(noteCreate.currentState?.value ?? {});
      }
      if (response.data?['status'] == true) {
        Toastify.showToast(
            ToastState.success, updateNoteId == null ? "Create note success".i18n : "Edit note success".i18n, context);
        Get.back(result: true);
        return true;
      }
      emit(const DetailsInitial());
      return false;
    } catch (e) {
      emit(const DetailsInitial());
      return false;
    }
  }

  Future<bool> deleteNote(int deleteId) async {
    try {
      emit(const Uploading());
      Response response = await _detailsProvider.deleteNote(deleteId);

      if (response.data?['status'] == true) {
        Toastify.showToast(ToastState.success, "Delete note success".i18n, context);
        print("====================");
        Get.back(result: true);
        return true;
      }
      Toastify.showToast(ToastState.failure, "Network Exception".i18n, context);
      emit(const DetailsInitial());
      return false;
    } catch (e) {
      Toastify.showToast(ToastState.failure, "Network Exception".i18n, context);
      emit(const DetailsInitial());
      return false;
    }
  }

  void createNote(int? updateNoteId) {
    noteCreate.currentState?.save();
    saveNote(updateNoteId);
  }

  void buttonDeleteNote(int id) {
    Get.back();
    deleteNote(id);
  }
}
