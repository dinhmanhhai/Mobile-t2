import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile/app/config/toast/toast_config.dart';
import 'package:mobile/app/data/theme/theme.dart';
import 'package:sizer/sizer.dart';

class Toastify {
  static FToast fToast = FToast();

  void showToastSuccess(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: ToastConfig.showTimeToast,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: SizeText.size14,
    );
  }

  void showToastFailed(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: ToastConfig.showTimeToast,
      backgroundColor: Colors.white,
      textColor: Colors.red,
      fontSize: SizeText.size14,
    );
  }

  void showToastNotification(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: ToastConfig.showTimeToast,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      fontSize: SizeText.size14,
    );
  }

  static showToast(ToastState toastState, String text, BuildContext context, {double? pos, int? showLongTime}) {
    fToast.init(context);
    Widget toast = Container(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: pos ?? 20.h),
      alignment: Alignment.center,
      // height: 7.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          // const Expanded(child: SizedBox()),
          const SizedBox(
            width: 12.0,
          ),
          SizedBox(
            width: 13.w,
            child: SvgPicture.asset(
              toastState == ToastState.failure ? "assets/noti/fail-noti.svg" : "assets/noti/success-noti.svg",
              width: 7.w,
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          SizedBox(
            width: (92 - 13).w - 24,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: SizeText.size14,
                color: CustomColor.blackBlueText,
              ),
            ),
          ),
          // const Expanded(child: SizedBox()),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      toastDuration: Duration(seconds: showLongTime ?? ToastConfig.showTimeToast),
      positionedToastBuilder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              // padding: EdgeInsets.only(bottom: 50.h),
              // alignment: Alignment.topCenter,
              child: child,
            ),
          ],
        );
      },
    );
  }
}
