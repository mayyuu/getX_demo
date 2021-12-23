import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/constants/app_colors.dart';
import 'package:getx_pattern_demo/main/app_vm.dart';

class LoadingWidget extends StatelessWidget {
  final bool loading;
  final Widget? customLoader;
  final Widget child;
  final double loaderMargin;
  late ThemeData themeData;

  LoadingWidget({Key? key,
    this.loading = true,
    this.customLoader,
    required this.child,
    this.loaderMargin = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    themeData = Get
        .find<AppVM>()
        .theme;
    return loading
        ? customLoader == null
        ? const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
      ),
    )
        : customLoader!
        : child;
  }
}
