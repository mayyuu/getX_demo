import 'package:domain/repository/post_repository.dart';
import 'package:domain/usecase/get_post_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetPostUseCase>(
            () => GetPostUseCase(Get.find<PostRepository>()));
  }

}