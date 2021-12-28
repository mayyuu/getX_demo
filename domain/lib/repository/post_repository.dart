

import 'package:dartz/dartz.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/post.dart';
import 'package:domain/usecase/get_post_details_usecase.dart';

abstract class PostRepository{
  Future<Either<NetworkError, List<Post>>> getPosts();
  Future<Either<NetworkError, Post?>> getPost(GetPostDetailsUseCaseParams? params);
}