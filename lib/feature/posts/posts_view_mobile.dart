import 'package:flutter/material.dart';
import 'package:getx_pattern_demo/base/base_page.dart';
import 'package:getx_pattern_demo/constants/app_colors.dart';
import 'package:getx_pattern_demo/feature/posts/posts_viewmodel.dart';
import 'package:getx_pattern_demo/widgets/loading_widget.dart';

class PostsMobilePortrait extends BasePageViewWidget<PostsViewModel> {
  PostsMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PostsViewModel model) {
    return LoadingWidget(
      loading: model.busy,
      child: Container(
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
                    return Container(
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
                    );
                  },
                )),
    );
  }
}
