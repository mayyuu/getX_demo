import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/constants/app_colors.dart';
import 'package:getx_pattern_demo/feature/splash/splash_viewmodel.dart';
import 'package:getx_pattern_demo/generated/l10n.dart';

class SplashMobilePortrait extends GetView<SplashViewModel> {
  SplashMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).splashTitle,
        style: const TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 35),
      ),
    );
  }
}
