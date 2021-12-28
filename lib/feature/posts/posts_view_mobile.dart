import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/base/base_page.dart';
import 'package:getx_pattern_demo/constants/app_colors.dart';
import 'package:getx_pattern_demo/feature/post_details/post_details_view.dart';
import 'package:getx_pattern_demo/feature/posts/posts_viewmodel.dart';
import 'package:getx_pattern_demo/navigation/route_paths.dart';
import 'package:getx_pattern_demo/widgets/loading_widget.dart';

class PostsMobilePortrait extends BasePageViewWidget<PostsViewModel> {
  PostsMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, PostsViewModel model) {
    return LoadingWidget(
      loading: model.busy.value,
      child: Container(
          color: AppColors.darkGreyShade,
          child: model.posts.isEmpty
              ? const Center(
                  child: Text(
                    "No data found",
                    style: TextStyle(color: AppColors.white),
                  ),
                )
              : ListView.builder(
                  itemCount: model.posts.length,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutePaths.PostDetails,
                            arguments: PostDetailsParams(model.posts[index]));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor)),
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Post id : ${model.posts[index].id}\n",
                              style: const TextStyle(color: AppColors.white),
                            ),
                            Text(
                              "Post title : ${model.posts[index].title}\n",
                              style: const TextStyle(color: AppColors.white),
                            ),
                            Text(
                              "Post body : ${model.posts[index].body}\n",
                              style: const TextStyle(color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
