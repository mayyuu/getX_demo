import 'package:data/entity/posts/post_entity.dart';
import 'package:data/entity/posts/post_response_entity.dart';
import 'package:data/network/rest/request/post_request.dart';
import 'package:data/source/product_datasource.dart';
import 'package:domain/usecase/get_post_details_usecase.dart';
import 'package:retrofit/retrofit.dart';

class PostDataSourceImpl extends PostDataSource {
  final PostRequest _postRequest;

  PostDataSourceImpl(this._postRequest);

  @override
  Future<HttpResponse<PostResponseEntity?>> getPosts() {
    return _postRequest.getPosts();
  }

  /// this is only for demo purpose as post details api is not present
  @override
  Future<PostEntity?> getPost(GetPostDetailsUseCaseParams? params) async {
    return await Future.delayed(
        const Duration(seconds: 1),
        () => PostEntity(
            id: params?.post?.id,
            body: params?.post?.body,
            title: params?.post?.title,
            userId: params?.post?.userId));
  }
}
