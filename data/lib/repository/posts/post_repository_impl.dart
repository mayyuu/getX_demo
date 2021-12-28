
import 'package:dartz/dartz.dart';
import 'package:data/entity/posts/post_response_entity.dart';
import 'package:data/network/rest/utils/safe_api_call.dart';
import 'package:data/source/product_datasource.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/post.dart';
import 'package:domain/repository/post_repository.dart';
import 'package:domain/usecase/get_post_details_usecase.dart';
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

  @override
  Future<Either<NetworkError, Post?>> getPost(GetPostDetailsUseCaseParams? params) async{
    try{
      final response = await _postDataSource.getPost(params);
      return Right(response?.transform());
    }
    on Exception catch(exception,_){
      return Left(NetworkError(cause: exception,httpError: 0,description: "There was a unexpected error please try again"));
    }
  }
}