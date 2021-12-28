import 'package:flutter/material.dart';
import 'package:getx_pattern_demo/base/base_page.dart';
import 'package:getx_pattern_demo/constants/app_colors.dart';
import 'package:getx_pattern_demo/feature/post_details/post_details_viewmodel.dart';
import 'package:getx_pattern_demo/widgets/loading_widget.dart';

class PostDetailsMobilePortrait
    extends BasePageViewWidget<PostsDetailsViewModel> {
  PostDetailsMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, PostsDetailsViewModel model) {
    return LoadingWidget(
      loading: model.busy.value,
      child: Container(
          color: AppColors.darkGreyShade,
          child: model.post.value == null
              ? const Center(
                  child: Text(
                    "No data found",
                    style: TextStyle(color: AppColors.white),
                  ),
                )
              : Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor)),
                margin: const EdgeInsets.only(top: 25,left: 10,right: 10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Post id : ${model.post.value?.id}\n",
                      style: const TextStyle(color: AppColors.white),
                    ),
                    Text(
                      "Post title : ${model.post.value?.title}\n",
                      style: const TextStyle(color: AppColors.white),
                    ),
                    Text(
                      "Post body : ${model.post.value?.body}\n",
                      style: const TextStyle(color: AppColors.white),
                    ),
                  ],
                ),
              )),
    );
  }
}
