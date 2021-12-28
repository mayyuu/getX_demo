import 'package:domain/model/post.dart';
import 'package:domain/usecase/get_post_usecase.dart';
import 'package:flutter/material.dart';
import 'package:getx_pattern_demo/base/base_vm.dart';
import 'package:get/get.dart';


class PostsViewModel extends BasePageViewModel {
  final GetPostUseCase _getPostUseCase;
  /// post list  holder
  List<Post> posts = List<Post>.empty(growable: true).obs;

  PostsViewModel(this._getPostUseCase,);

  getPosts(GetPostUseCaseParams params) async{
    setBusy(true);
    final response = await _getPostUseCase.execute(params: params);
    response.fold((l) {
      debugPrint(l.error.message);
      showToastWithError(l);
      setBusy(false);
    }, (r) {
      posts.addAll(r);
      setBusy(false);
    });
  }

  @override
  void onInit() {
    super.onInit();
    getPosts(GetPostUseCaseParams());
  }
}
