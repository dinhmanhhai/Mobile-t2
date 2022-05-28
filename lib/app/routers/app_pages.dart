import 'package:get/get.dart';
import 'package:mobile/app/pages/details/details_view.dart';
import 'package:mobile/app/pages/home/home_view.dart';
import 'package:mobile/app/pages/login/login_view.dart';
import 'package:mobile/app/pages/splash_sreen/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/splash';

  static final routes = [
    GetPage(
      name: Routes.details,
      page: () => DetailsView(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => SplashView(),
    ),
  ];
}
