

import 'package:data/entity/posts/post_response_entity.dart';
import 'package:retrofit/retrofit.dart';

abstract class PostDataSource{
  Future<HttpResponse<PostResponseEntity?>> getPosts();
}