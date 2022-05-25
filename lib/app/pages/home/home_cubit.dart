import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BuildContext context;
  late Response result;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  HomeCubit(this.context) : super(const LoginInitial());

  Future<void> signIn() async {
    try {
      GoogleSignInAccount? res = await _googleSignIn.signIn();
      print(res);
    } catch (e) {
      print('Error signing in $e');
    }
  }

  void signOut() {
    _googleSignIn.disconnect();
  }
}
