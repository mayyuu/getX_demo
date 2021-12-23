import 'package:dartz/dartz.dart';
import 'package:domain/error/base_error.dart';

import 'params.dart';

abstract class BaseUseCase<E extends BaseError, P extends Params, T> {
  Future<Either<E, T>> execute({P? params});
}
