

import 'package:data/entity/posts/post_entity.dart';
import 'package:data/entity/posts/post_response_entity.dart';
import 'package:domain/usecase/get_post_details_usecase.dart';
import 'package:retrofit/retrofit.dart';

abstract class PostDataSource{
  Future<HttpResponse<PostResponseEntity?>> getPosts();
  Future<PostEntity?> getPost(GetPostDetailsUseCaseParams? params);
}