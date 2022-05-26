part of 'theme.dart';

class CustomColors {
  static final Color firebaseNavy = Color(0xFF2c384a);
  static final Color firebaseOrange = Color(0xFFf57b00);
  static final Color firebaseYellow = Color(0xFFfeca27);
  static const Color yellowText = Color(0xFFffd455);
  static const Color greyText = Color(0xFFBDBDBD);
  static const Color blueText = Color(0xFF0077C0);
  static const Color regularText = Color(0xFF333333);
  static const Color backGroundColor = Color(0xFFF2F2F2);
  static const Color darkBlueText = Color(0xFF02275A);
  static const Color floatingButtonColor = Color(0xFFe57373);
  static const Color cardColor = Color(0xFF5a5a5b);
}

class GradientColors {
  static const Gradient appColorGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: <Color>[
      Color(0xFF007DBC),
      Color(0xFF1B44A6),
      Color(0xFF301996),
    ],
  );
}

class SizeText {
  static double size12 = 12.0;
  static double size14 = 14.0;
  static double size16 = 16.0;
  static double size18 = 18.0;
  static double size20 = 20.0;
  static double size22 = 22.0;
  static double size24 = 24.0;
  static double size26 = 26.0;
  static double size28 = 28.0;
}

class ScreenSize {
  static double height = Get.height;
  static double width = Get.width;
}

TextStyle get titleTextStyle {
  return TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: CustomColors.yellowText);
}

TextStyle get subTitleTextStle {
  return TextStyle(fontSize: 16, color: CustomColors.yellowText);
}

const List<Color> listColors = [
  Color(0xFF2484A8),
  Color(0xFFDEEA48),
  Color(0xFFFC6D9A),
  Color(0xFF22AB65),
  Color(0xFFC0AC4C),
  Color(0xFF4A0077),
  Color(0xFFEC449E),
  Color(0xFF24F3E7),
  Color(0xFFE1C06D),
  Color(0xFF36A6D4),
  Color(0xFF8bd6f8),
  Color(0xFF3BC3C2),
  Color(0xFFF55CF9),
  Color(0xFF5719AB),
  Color(0xFFB1AA6D),
  Color(0xFFF3B60D),
  Color(0xFFAC087E),
  Color(0xFFF20E6C),
  Color(0xFFCD4D4C),
  Color(0xFF39BE85),
  Color(0xFFae9d85),
  Color(0xFF33D51F),
  Color(0xFF868708),
];
