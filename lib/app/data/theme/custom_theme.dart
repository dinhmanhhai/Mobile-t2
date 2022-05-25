part of 'theme.dart';


class CustomColor {
  static const Color blurredLetters = Color(0xFF828282);
  static const Color greyText = Color(0xFFBDBDBD);
  static const Color blueText = Color(0xFF0077C0);
  static const Color regularText = Color(0xFF333333);
  static const Color backGroundColor = Color(0xFFF2F2F2);
  static const Color darkBlueText = Color(0xFF02275A);
  static const Color blackBlueText = Color(0xFF223046);
  static const Color bottomNavigatorColor = Color(0xFFF2F5F7);
  static const Color lightBlue = Color(0xFFE5F1F9);
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

const Color purpleClr = Color(0xFFA0338A);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFF54B80);

const primaryClr = purpleClr;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = Colors.grey[800]!;

class Themes {
  static final light = ThemeData(
    backgroundColor: Colors.grey[100],
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
    primaryColor: primaryClr,
  );
}

TextStyle get subHeadingTextStyle {
  return TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Get.isDarkMode ? Colors.grey[400] : Colors.grey);
}

TextStyle get titleTextStyle {
  return TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Get.isDarkMode ? Colors.white : Colors.black);
}

TextStyle get subTitleTextStle {
  return TextStyle(fontSize: 16, color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[700]);
}

TextStyle get bodyTextStyle {
  return TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Get.isDarkMode ? Colors.white : Colors.black);
}
