part of 'theme.dart';

class CustomColors {
  static final Color firebaseNavy = Color(0xFF2C384A);
  static final Color firebaseOrange = Color(0xFFF57C00);
  static final Color firebaseYellow = Color(0xFFFFCA28);
  static const Color blurredLetters = Color(0xFF828282);
  static const Color greyText = Color(0xFFBDBDBD);
  static const Color blueText = Color(0xFF0077C0);
  static const Color regularText = Color(0xFF333333);
  static const Color backGroundColor = Color(0xFFF2F2F2);
  static const Color darkBlueText = Color(0xFF02275A);
  static const Color blackBlueText = Color(0xFF223046);
  static const Color bottomNavigatorColor = Color(0xFFF2F5F7);
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
}

class ScreenSize {
  static double height = Get.height;
  static double width = Get.width;
}

TextStyle get subHeadingTextStyle {
  return TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Get.isDarkMode ? Colors.grey[400] : Colors.grey);
}

TextStyle get titleTextStyle {
  return TextStyle(
      fontSize: 18, fontWeight: FontWeight.w400, color: Get.isDarkMode ? Colors.white : CustomColors.regularText);
}

TextStyle get googleFontTitle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400, color: Get.isDarkMode ? Colors.white : CustomColors.regularText));
}

TextStyle get subTitleTextStle {
  return TextStyle(fontSize: 16, color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[700]);
}

TextStyle get bodyTextStyle {
  return TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: Get.isDarkMode ? Colors.white : CustomColors.regularText);
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
