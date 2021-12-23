import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/bindings/main_bindings.dart';
import 'package:getx_pattern_demo/generated/l10n.dart';
import 'package:getx_pattern_demo/main/app_vm.dart';
import 'package:getx_pattern_demo/navigation/route_paths.dart';
import 'package:getx_pattern_demo/navigation/router.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateTitle: (context) => S.of(context).appName,
        debugShowCheckedModeBanner: false,
        /*theme: Get.find<AppVM>().theme,*/
        initialRoute: RoutePaths.Posts,
        initialBinding: MainBinding(),
        getPages: AppRouter.routes,
        );
  }
}
