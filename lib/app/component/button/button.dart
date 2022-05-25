import 'package:flutter/material.dart';
import 'package:mobile/app/data/theme/theme.dart';
import 'package:sizer/sizer.dart';

class Button extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final Color? color;
  final Widget? child;
  final double? width;

  const Button({Key? key, this.onTap, this.text, this.child, this.color, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 615,
          ),
          width: width ?? 100.w,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          decoration: BoxDecoration(color: color ?? CustomColor.blueText, borderRadius: BorderRadius.circular(100)),
          child: child ??
              Text(
                "$text",
                style: TextStyle(
                  color: CustomColor.backGroundColor,
                  fontSize: SizeText.size14,
                  fontWeight: FontWeight.w700,
                ),
              ),
        ),
      ),
    );
  }
}