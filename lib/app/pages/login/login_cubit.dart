import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile/app/config/toast/toast_config.dart';
import 'package:mobile/app/data/i18n/i18n.dart';
import 'package:mobile/app/routers/app_pages.dart';
import 'package:mobile/app/utils/toast.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final BuildContext context;

  // late Response result;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  LoginCubit(this.context) : super(const LoginInitial());

  Future<void> login() async {
    try {
      // GoogleSignInAccount? res = await _googleSignIn.signIn();
      // print(res);
      // Map<String, dynamic> params = {
      //   'displayName': res?.displayName ?? '',
      //   'userId': res?.id ?? '',
      //   'email': res?.email ?? '',
      //   'photoUrl': res?.photoUrl,
      //   'serverAuthCode': res?.serverAuthCode,
      // };
      // Response response = await LoginProvider.login(params);
      // print(response.data);
      Get.toNamed(Routes.home);
    } catch (e) {
      Toastify.showToast(ToastState.failure, "Network Exception".i18n, context);
    }
  }

  void logout() {
    _googleSignIn.disconnect();
  }
}
