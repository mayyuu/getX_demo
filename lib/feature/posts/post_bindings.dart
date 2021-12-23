import 'package:domain/usecase/get_post_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:getx_pattern_demo/feature/posts/posts_viewmodel.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostsViewModel>(
            () => PostsViewModel(Get.find<GetPostUseCase>()));
  }

}