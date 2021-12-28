import 'package:domain/model/post.dart';
import 'package:domain/usecase/get_post_details_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/base/base_page.dart';
import 'package:getx_pattern_demo/constants/app_colors.dart';
import 'package:getx_pattern_demo/feature/post_details/post_details_view_mobile.dart';
import 'package:getx_pattern_demo/feature/post_details/post_details_viewmodel.dart';
import 'package:getx_pattern_demo/generated/l10n.dart';

class PostDetailsView extends BasePage<PostsDetailsViewModel> {

  PostDetailsView({Key? key}) : super(key: key);

  @override
  _PostDetailsViewState createState() => _PostDetailsViewState();
}

class _PostDetailsViewState
    extends BaseStatefulPage<PostsDetailsViewModel, PostDetailsView> {
  @override
  PreferredSizeWidget buildAppbar() {
    return AppBar(
      backgroundColor: AppColors.transparent,
      centerTitle: true,
      title: Text(
        S.of(context).postDetailsTitle,
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
  void initState() {
    super.initState();
    PostDetailsParams? postDetailsParams = Get.arguments;
    getViewModel()?.getPost(GetPostDetailsUseCaseParams(post: postDetailsParams?.post));
  }

  @override
  Widget buildView(BuildContext context) {
    return PostDetailsMobilePortrait();
  }
}

class PostDetailsParams{
  final Post? post;
  PostDetailsParams(this.post);
}
