import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget circularCustom({Color? color, double? size}) {
  return SizedBox(height: size ?? 3.h, width: size ?? 3.h, child: CircularProgressIndicator(color: color ?? Colors.white));
}