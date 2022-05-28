import 'package:flutter/material.dart';
import 'package:mobile/app/data/theme/theme.dart';
import 'package:mobile/app/pages/home/providers/home_provider.dart';
import 'package:mobile/app/routers/app_pages.dart';
import 'package:mobile/app/utils/application.dart';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    loadApiUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      body: Center(
        child: SizedBox(
            width: 45.w,
            child: LinearProgressIndicator(value: animation.value)),
      ),
    );
  }

  void loadApiUserInfo() {
    controller.forward().whenComplete(() async {
      if (Application.sharePreference?.getString("token") != null) {
        try {
          Response res = await HomeProvider.getUserInfo();
          if (res.data?['status'] == true) {
            Application.displayName = Application.displayName;
            Future.delayed(Duration(seconds: 1));
            Get.offNamed(Routes.home);
          } else {
            Get.offNamed(Routes.login);
          }
        } on Exception catch (e) {
          Get.offNamed(Routes.home);
        }
      } else {
        Get.offNamed(Routes.home);
      }
    });
  }
}
