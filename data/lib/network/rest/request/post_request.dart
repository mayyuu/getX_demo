import 'package:data/entity/posts/post_response_entity.dart';
import 'package:data/network/rest/api_service.dart';
import 'package:retrofit/retrofit.dart';

class PostRequest{
  final ApiService _apiService;

  PostRequest(this._apiService);

  Future<HttpResponse<PostResponseEntity?>> getPosts(){
    return _apiService.getPosts();
  }
}