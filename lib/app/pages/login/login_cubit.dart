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
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final BuildContext context;

  // late Response result;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  LoginCubit(this.context) : super(const LoginInitial());

  Future<void> login() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(permissions: ['public_profile', 'email', 'pages_show_list', 'pages_messaging', 'pages_manage_metadata']);
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        print(accessToken.userId);
        print(accessToken.graphDomain);
        print(accessToken.applicationId);
      } else {
        print(result.status);
        print(result.message);
      }
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
      // Get.toNamed(Routes.home);

    } catch (e) {
      Toastify.showToast(ToastState.failure, "Network Exception".i18n, context);
    }
  }

  void logout() {
    _googleSignIn.disconnect();
  }
}
