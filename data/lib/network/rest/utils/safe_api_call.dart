import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:data/network/rest/utils/get_error.dart';
import 'package:dio/dio.dart';
import 'package:domain/error/network_error.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

Future<Either<NetworkError, T>> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as HttpResponse<dynamic>;
    if (!eitherResponse.isSuccessful()) {
      return Left(getError(apiResponse: eitherResponse.response));
    } else {
      debugPrint("original response $originalResponse");
      return Right(originalResponse);
    }
  } on Exception catch (throwable) {
    debugPrint(throwable.toString());
    switch (throwable.runtimeType) {
      case DioError:
        switch ((throwable as DioError).type) {
          case DioErrorType.connectTimeout:
            return Left(
              NetworkError(
                  message:
                  "Connection timeout with API server",
                  httpError: 503,
                  cause: throwable),
            );
          case DioErrorType.sendTimeout:
            return Left(
              NetworkError(
                  message:
                  "Receive timeout exception",
                  httpError: 503,
                  cause: throwable),
            );
          case DioErrorType.receiveTimeout:
            return Left(
              NetworkError(
                  message:
                  "Receive timeout in connection with API server",
                  httpError: 503,
                  cause: throwable),
            );
          case DioErrorType.response:
            if (throwable is DioError) {
              return Left(getError(apiResponse: throwable.response));
            }
            return Left(
              NetworkError(
                  message:
                  "Request to API server was cancelled",
                  httpError: 503,
                  cause: throwable),
            );
          case DioErrorType.cancel:
            return Left(
              NetworkError(
                  message:
                  "Request to API server was cancelled",
                  httpError: 503,
                  cause: throwable),
            );
          case DioErrorType.other:
            return Left(
              NetworkError(
                  message:
                      "Connection to API server failed due to internet connection",
                  httpError: 503,
                  cause: throwable),
            );
        }
        break;
      case IOException:
        return Left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));
      default:
        return Left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));
    }
  }
}

extension RetrofitResponse on HttpResponse {
  /**
   * Returns true if the code is in [200..300), which means the request was successfully received,
   * understood, and accepted.
   */
  bool isSuccessful() {
    return response.statusCode! >= 200 && response.statusCode! < 300;
  }
}
