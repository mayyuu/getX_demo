
import 'package:dartz/dartz.dart';
import 'package:data/entity/posts/post_response_entity.dart';
import 'package:data/network/rest/utils/safe_api_call.dart';
import 'package:data/source/product_datasource.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/post.dart';
import 'package:domain/repository/post_repository.dart';
import 'package:retrofit/retrofit.dart';


class PostRepositoryImpl extends PostRepository{
  final PostDataSource _postDataSource;

  PostRepositoryImpl(this._postDataSource);

  @override
  Future<Either<NetworkError, List<Post>>> getPosts() async{
    final response = await safeApiCall<HttpResponse<PostResponseEntity?>>(
        _postDataSource.getPosts());
    return response.fold(
            (left) => Left(left), (r) => Right(r.data?.transform() ?? []));
  }

}