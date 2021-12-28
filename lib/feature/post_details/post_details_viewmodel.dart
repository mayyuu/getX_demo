import 'package:domain/model/post.dart';
import 'package:domain/usecase/get_post_details_usecase.dart';
import 'package:domain/usecase/get_post_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_pattern_demo/base/base_vm.dart';
import 'package:get/get.dart';


class PostsDetailsViewModel extends BasePageViewModel {
  final GetPostDetailsUseCase _getPostUseCase;
  /// post list  holder
  Rx<Post?> post = Post().obs;

  PostsDetailsViewModel(this._getPostUseCase,);


  getPost(GetPostDetailsUseCaseParams params) async{
    setBusy(true);
    final response = await _getPostUseCase.execute(params: params);
    response.fold((l) {
      debugPrint(l.error.message);
      showToastWithError(l);
      setBusy(false);
    }, (r) {
      post(r);
      setBusy(false);
    });
  }
}
