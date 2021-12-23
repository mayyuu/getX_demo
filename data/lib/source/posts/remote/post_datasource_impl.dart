

import 'package:data/entity/posts/post_response_entity.dart';
import 'package:data/network/rest/request/post_request.dart';
import 'package:data/source/product_datasource.dart';
import 'package:retrofit/retrofit.dart';

class PostDataSourceImpl extends PostDataSource{
  final PostRequest _postRequest;

  PostDataSourceImpl(this._postRequest);

  @override
  Future<HttpResponse<PostResponseEntity?>> getPosts() {
    return _postRequest.getPosts();
  }

}