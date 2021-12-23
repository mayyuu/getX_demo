import 'package:domain/constants/error_types.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/model/error_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getx_pattern_demo/constants/app_colors.dart';
import 'base_vm.dart';
import 'base_widget.dart';

/// Every Page/View should be inherited from this
abstract class BasePage<VM extends BasePageViewModel> extends StatefulWidget {
  BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<VM extends BasePageViewModel,
T extends BasePage<VM>> extends State<T> {}

abstract class BaseStatefulPage<VM extends BasePageViewModel,
B extends BasePage<VM>> extends BasePageState<VM, B> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  VM? _viewModel;

  bool get attached => _viewModel != null;

  @override
  Widget build(BuildContext context) {
    return _getLayout();
  }

  /// Returns viewModel of the screen
  VM? getViewModel() {
    return attached
        ? _viewModel
        : throw AppError(
      cause: Exception("View model is not attached"),
      error: ErrorInfo(message: "View Model is not attached"),
      type: ErrorType.UI,
    );
  }

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  /// Actual Screen which load scaffold and load UI
  Widget _getLayout() {
    return BaseWidget<VM>(
        onModelReady: _onBaseModelReady,
        builder: (BuildContext context, VM model) {
          return SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              appBar: buildAppbar(),
              extendBodyBehindAppBar: extendBodyBehindAppBar(),
              body: _buildScaffoldBody(context, model),
              drawer: buildDrawer(),
              drawerEnableOpenDragGesture: drawerEnableOpenDragGesture(),
            ),
          );
        });
  }

  /// Building a appbar of screen
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  /// Building a drawer of screen
  Widget? buildDrawer() {
    return null;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  bool drawerEnableOpenDragGesture() {
    return false;
  }

  Widget _buildScaffoldBody(BuildContext context, VM model) {
    return buildView(context, model);
  }

  @mustCallSuper
  Widget buildView(BuildContext context, VM model);

  void _onBaseModelReady(VM model) {
    _viewModel = model;
    model.error.listen((event) {
      showSnackBar(event.error.message ?? 'There was an unexpected error');
    });
    model.toast.listen((message) {
      showSnackBar(message);
    });
    onModelReady(model);
  }

  showSnackBar(String message) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      backgroundColor: AppColors.black,
      content: Row(
        children: [
          Text(
            message,
            style: const TextStyle(color: AppColors.white),
          ),
        ],
      ),
    ));
  }

  Future<bool> exitPage({dynamic param}) {
    return _onWillPop(param);
  }

  Future<bool> _onWillPop(dynamic param) {
    if (Navigator.canPop(context)) {
      if (param != null) {
        Navigator.pop(context, param);
      } else {
        Navigator.pop(
          context,
        );
      }
    }
    return Future.value(true);
  }

  /*Mandatory*/

  /// You can setup load something when model is ready, Ex: Load or fetch some data from remote layer
  void onModelReady(VM model) {}

}

abstract class BasePageViewWidget<T extends BasePageViewModel> extends Widget {
  BasePageViewWidget({Key? key}) : super(key: key);

  @protected
  Widget build(BuildContext context, T model);

  @override
  DataProviderElement<T> createElement() =>
      DataProviderElement<T>(this);
}

class DataProviderElement<T extends BasePageViewModel>
    extends ComponentElement {

  late BasePageViewWidget _basePageViewWidget;

  DataProviderElement(BasePageViewWidget widget)
      : super(widget){
    _basePageViewWidget = widget;
  }

  @override
  BasePageViewWidget get widget => _basePageViewWidget;

  @override
  Widget build() {
    return BaseWidget<T>(
      builder: (context, model) {
        return widget.build(this, model);
      },
    );
  }
}
