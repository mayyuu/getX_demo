import 'package:domain/usecase/get_post_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getx_pattern_demo/base/base_page.dart';
import 'package:getx_pattern_demo/constants/app_colors.dart';
import 'package:getx_pattern_demo/feature/posts/posts_view_mobile.dart';
import 'package:getx_pattern_demo/feature/posts/posts_viewmodel.dart';
import 'package:getx_pattern_demo/generated/l10n.dart';



class PostView extends BasePage<PostsViewModel> {
  PostView({Key? key}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState
    extends BaseStatefulPage<PostsViewModel, PostView> {
  @override
  PreferredSizeWidget buildAppbar() {
    return AppBar(
      backgroundColor: AppColors.transparent,
      centerTitle: true,
      title: Text(
        S.of(context).postTitle,
        style: const TextStyle(
          fontFamily: 'Barlow',
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      ),
      elevation: 0,
    );
  }

  @override
  void onModelReady(PostsViewModel model) {
    model.getPosts(GetPostUseCaseParams());
  }

  @override
  Widget buildView(BuildContext context, model) {
    return PostsMobilePortrait();
  }
}
