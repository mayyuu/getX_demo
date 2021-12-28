import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/base/base_page.dart';
import 'package:getx_pattern_demo/feature/splash/splash_view_mobile.dart';
import 'package:getx_pattern_demo/feature/splash/splash_viewmodel.dart';
import 'package:getx_pattern_demo/navigation/route_paths.dart';

class SplashView extends BasePage<SplashViewModel> {

  SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState
    extends BaseStatefulPage<SplashViewModel, SplashView> {

  @override
  void initState() {
    super.initState();
    getViewModel()?.startMainActivityTimeOut();
    getViewModel()?.navigationObservable.listen((status) async {
      Get.offNamed(RoutePaths.Posts);
    });
  }

  @override
  Widget buildView(BuildContext context) {
    return SplashMobilePortrait();
  }
}

