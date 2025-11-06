import 'package:get/get.dart';

import 'routes.dart';
import '../../features/screens.dart';
import '../../features/bindings.dart';

class Navigation {
  Navigation._();
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    // initial app navigation
    GetPage(
      name: Routes.initialRoute,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    // login navigation
    GetPage(
      name: Routes.signInRoute,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    // home navigation
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
