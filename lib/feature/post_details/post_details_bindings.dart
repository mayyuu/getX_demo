import 'package:domain/usecase/get_post_details_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:getx_pattern_demo/feature/post_details/post_details_viewmodel.dart';

class PostDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostsDetailsViewModel>(
            () => PostsDetailsViewModel(Get.find<GetPostDetailsUseCase>()));
  }

}