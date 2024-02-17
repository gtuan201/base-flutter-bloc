import 'package:clean_architect/features/presentation/screens/login/login_screen.dart';
import 'package:clean_architect/features/presentation/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  const Routes._();

  static var page = <GetPage>[
    GetPage(
      name: SplashScreen.route,
      page: () => SplashScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: LoginScreen.route,
      page: () => LoginScreen(),
      transition: Transition.fade,
    ),
  ];
}
