

import 'package:dartz/dartz.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/post.dart';

abstract class PostRepository{
  Future<Either<NetworkError, List<Post>>> getPosts();
}