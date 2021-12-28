import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/model/post.dart';
import 'package:domain/repository/post_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';


class GetPostDetailsUseCase
    extends BaseUseCase<AppError, GetPostDetailsUseCaseParams,  Post?> {
  final PostRepository _postRepository;

  GetPostDetailsUseCase(this._postRepository);

  @override
  Future<Either<AppError,  Post?>> execute(
      {GetPostDetailsUseCaseParams? params}) async {
    final response = await _postRepository.getPost(params);
    return response.fold(
            (left) => Left(left.transform()), (r) => Right(r));
  }
}

class GetPostDetailsUseCaseParams extends Params {
  final Post? post;
  GetPostDetailsUseCaseParams({required this.post});
  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}