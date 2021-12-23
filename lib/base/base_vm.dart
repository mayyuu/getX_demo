import 'dart:async';
import 'package:domain/error/app_error.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rxdart/rxdart.dart';


class BasePageViewModel extends GetxController {
  PublishSubject<AppError> _error = PublishSubject<AppError>();
  PublishSubject<String> _toast = PublishSubject<String>();

  Stream<AppError> get error => _error.stream;

  Stream<String> get toast => _toast.stream;

  void showToastWithError(AppError error) {
    _error.sink.add(error);
  }

  void showToastWithString(String message) {
    _toast.sink.add(message);
  }

  void notify() {
    update();
  }

  @override
  void dispose() {
    _error.close();
    _toast.close();
    super.dispose();
  }
}

