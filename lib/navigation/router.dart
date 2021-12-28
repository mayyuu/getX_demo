import 'package:get/get.dart';
import 'package:getx_pattern_demo/feature/post_details/post_details_bindings.dart';
import 'package:getx_pattern_demo/feature/post_details/post_details_view.dart';
import 'package:getx_pattern_demo/feature/posts/post_bindings.dart';
import 'package:getx_pattern_demo/feature/posts/posts_view.dart';
import 'package:getx_pattern_demo/feature/splash/splash_bindings.dart';
import 'package:getx_pattern_demo/feature/splash/splash_view.dart';
import 'package:getx_pattern_demo/navigation/route_paths.dart';


class AppRouter {
  static final routes = [
    GetPage(
        name: RoutePaths.Splash,
        page: () => SplashView(),
        binding: SplashBinding()
    ),
    GetPage(
      name: RoutePaths.Posts,
      page: () => PostView(),
      binding: PostBinding()
    ),
    GetPage(
        name: RoutePaths.PostDetails,
        page: () => PostDetailsView(),
        binding: PostDetailsBinding()
    ),
  ];
}
