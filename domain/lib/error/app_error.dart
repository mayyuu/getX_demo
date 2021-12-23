import 'package:domain/constants/error_types.dart';
import 'package:domain/error/base_error.dart';
import 'package:domain/model/error_info.dart';

class AppError extends BaseError {
  ErrorType type;
  ErrorInfo error;
  Exception cause;

  AppError({
    required this.cause,
    required this.error,
    required this.type,
  }) : super(cause: cause,error: error);

  @override
  String getFriendlyMessage() {
    return error.message ?? '';
  }
}
