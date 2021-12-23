import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/// StatefulWidget for T type of ViewModel / ChangeNotifier
class BaseWidget<T extends GetxController> extends StatefulWidget {
  final Widget Function(BuildContext context, T getXController)
      builder;
  final Function(T)? onModelReady;
  final Widget? child;

  BaseWidget({
    Key? key,
    required this.builder,
    this.onModelReady,
    this.child,
  }) : super(key: key);

  @override
  _BaseWidget<T> createState() => _BaseWidget<T>();

}
class _BaseWidget<T extends GetxController> extends State<BaseWidget<T>> {
  late T _model;

  @override
  void initState() {
    super.initState();
    _model = GetInstance().find<T>();
    widget.onModelReady?.call(_model);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: ( controller) => widget.builder(context, controller),);
  }
}

