import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/// StatefulWidget for T type of ViewModel / ChangeNotifier
class BaseWidget<T extends GetxController> extends GetView<T> {
  final Widget Function(BuildContext context, T getXController)
      builder;

  BaseWidget({
    Key? key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context)  => Obx(() => builder(context, controller));
}

