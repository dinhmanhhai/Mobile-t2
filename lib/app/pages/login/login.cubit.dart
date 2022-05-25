import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app/config/toast/toast_config.dart';
import 'package:mobile/app/pages/login/providers/login_provider.dart';
import 'package:mobile/app/utils/toast.dart';

part 'login.state.dart';

class LoginCubit extends Cubit<LoginState> {
  // final GlobalKey<FormBuilderState> phone = GlobalKey<FormBuilderState>();
  // final GlobalKey<FormBuilderState> pass = GlobalKey<FormBuilderState>();
  final BuildContext context;

  late Response result;

  LoginCubit(this.context) : super(const LoginInitial());

  Future<bool> login() async {
    try {
      // emit(const Loging());
      result = await LoginProvider.login({});
      print("======================");
      print(result);
      // if (result.data['status']) {
      //   Application.sharePreference
      //     ?..putString("token", result.data['data']['token'])
      //     ..putString("phone", phone.currentState!.value['phone'].toString().trim())
      //     ..putString("password", pass.currentState!.value['password'].toString());
      //   print("==================");
      //   print(Application.sharePreference!.getString('token'));
      //   getJwt();
      //   Future.delayed(Duration(seconds: 1));
      //   emit(const LoginInitial());
      //   return true;
      // } else {
      //   if (result.data["httpCode"] == 500) {
      //     await Toastify.showToast(ToastState.FAILURE, "Lỗi kết nối ", context);
      //   } else {
      //     await Toastify.showToast(ToastState.FAILURE, "Thông tin đăng nhập không chính xác", context);
      //   }
      //   emit(const LoginInitial());
      return false;
      // }
    } catch (e) {
      await Toastify.showToast(ToastState.failure, "Lỗi kết nối", context);
      return false;
    }
  }

  Future<void> handleOnTap() async {
    login();
    // if (phone.currentState!.saveAndValidate() && pass.currentState!.saveAndValidate()) {
    //   if (await login()) {}
    // }
  }
}
