import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/model/post.dart';
import 'package:domain/repository/post_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';


class GetPostUseCase
    extends BaseUseCase<AppError, GetPostUseCaseParams,  List<Post>> {
  final PostRepository _postRepository;

  GetPostUseCase(this._postRepository);

  @override
  Future<Either<AppError,  List<Post>>> execute(
      {GetPostUseCaseParams? params}) async {
    final response = await _postRepository.getPosts();
    return response.fold(
            (left) => Left(left.transform()), (r) => Right(r));
  }
}

class GetPostUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}