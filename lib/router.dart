import 'package:go_router/go_router.dart';
import 'package:star_wars_fan_app/features/home/view/home_page.dart';
import 'package:star_wars_fan_app/features/resource_details/view/resource_details_page.dart';
import 'package:star_wars_fan_app/features/splash/view/splash_page.dart';
import 'package:star_wars_fan_app/models/models.dart';

export 'package:go_router/go_router.dart';

class MyRouter {
  static const splashPageName = "splash";
  static const homePageName = "home";
  static const resourceDetailsPageName = "resourceDetails";

  static GoRouter getRouter() {
    return GoRouter(routes: [
      GoRoute(
        name: splashPageName,
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
          name: homePageName,
          path: '/home',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              name: resourceDetailsPageName,
              path: 'vehicle',
              builder: (context, state) => ResourceDetailsPage(resource: state.extra! as Resource),
            ),
          ]),
    ]);
  }
}
