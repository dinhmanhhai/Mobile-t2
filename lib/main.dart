import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/theme/theme.dart';
import 'package:mobile/app/routers/app_pages.dart';
import 'package:mobile/app/utils/api.dart';
import 'package:mobile/app/utils/application.dart';
import 'package:mobile/app/utils/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';

import 'app/utils/toast.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance!.resamplingEnabled = true;
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Application.api = API();
  Application.toast = Toastify();
  Application.sharePreference = await SpUtil.getInstance();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            FormBuilderLocalizations.delegate,
          ],
          locale: Locale('vi', 'VN'),
          debugShowCheckedModeBanner: false,
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: ThemeData(
            textSelectionTheme: TextSelectionThemeData(cursorColor: CustomColors.yellowText),
          ),
        );
      },
    ),
  );
}