import 'package:domain/model/post.dart';
import 'package:domain/usecase/get_post_usecase.dart';
import 'package:flutter/material.dart';
import 'package:getx_pattern_demo/base/base_vm.dart';

class PostsViewModel extends BasePageViewModel {
  final GetPostUseCase _getPostUseCase;
  /// post list  holder
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  set posts(List<Post> value) {
    _posts = value;
    update();
  }

  PostsViewModel(this._getPostUseCase,);

  getPosts(GetPostUseCaseParams params) async{
    setBusy(true);
    final response = await _getPostUseCase.execute(params: params);
    response.fold((l) {
      debugPrint(l.error.message);
      showToastWithError(l);
      setBusy(false);
    }, (r) {
      posts = r;
      setBusy(false);
    });
  }
}
