import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:getx_pattern_demo/feature/splash/splash_viewmodel.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashViewModel>(
            () => SplashViewModel());
  }
}