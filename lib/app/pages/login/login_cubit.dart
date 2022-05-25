import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final BuildContext context;
  late Response result;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  LoginCubit(this.context) : super(const LoginInitial());

  Future<void> login() async {
    try {
      GoogleSignInAccount? res = await _googleSignIn.signIn();
      res?.id;
      res?.displayName;
      res?.displayName;
      res?.email;
      res?.photoUrl;
      res?.serverAuthCode;
      print(res.toString());
    } catch (e) {
      print('Error signing in $e');
    }
  }

  void logout() {
    _googleSignIn.disconnect();
  }
}
