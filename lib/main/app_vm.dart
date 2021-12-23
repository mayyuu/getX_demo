import 'package:flutter/material.dart';
import 'package:getx_pattern_demo/base/base_vm.dart';
import 'package:getx_pattern_demo/constants/app_colors.dart';
import 'package:getx_pattern_demo/constants/app_theme.dart';

class AppVM extends BasePageViewModel {
  final AppTheme _theme = AppTheme.primary;
  final ThemeData _themeData = ThemeData.dark();

  ThemeData get theme {
    switch (_theme) {
      case AppTheme.primary:
      default:
        return _themeData.copyWith(
          primaryColor: AppColors.primaryColor,
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.white, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.gray, width: 1.55)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.white, width: 1.55)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.white, width: 1.55)),
            errorStyle: TextStyle(
              color: AppColors.white,
            ),
            labelStyle: TextStyle(
              color: AppColors.gray,
              fontFamily: 'Barlow',
            ),
          ),
          textTheme: _themeData.textTheme.apply(fontFamily: 'Barlow'),
          primaryTextTheme:
              _themeData.primaryTextTheme.apply(fontFamily: 'Barlow'),
          iconTheme: const IconThemeData(
            color: AppColors.primaryColor,
          ),
        );
    }
  }
}
