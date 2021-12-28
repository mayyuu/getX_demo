import 'package:getx_pattern_demo/base/base_vm.dart';
import 'package:rxdart/rxdart.dart';


class SplashViewModel extends BasePageViewModel {
  var navigationObservable = PublishSubject<bool>();

  startMainActivityTimeOut() {
    Rx.timer(true, const Duration(seconds: 2)).listen((status) {
      if (status) {
        navigationObservable.add(true);
      }
    });
  }
}
