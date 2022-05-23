import 'package:get/get.dart';
import 'package:mobile/app/pages/login/login.view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/login';

  static final routes = [
    // GetPage(
    //   name: Routes.SPLASH,
    //   page: () => SplashView(),
    //   binding: SplashBinding(),
    // ),
    // GetPage(
    //   name: Routes.HOME,
    //   page: () => HomeView(),
    //   binding: HomeBinding(),
    // ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
    ),
  ];
}
