import 'dart:developer';

import 'package:clean_architecture_practice/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

Future<Either<Failure, T>> handleNetworkError<T>(
    Future<T> Function() apiCall) async {
  try {
    final response = await apiCall();
    log('Response $response');
    return Right(response);
  } catch (e) {
    // if (e is DioException) {
    //   final customError = CustomDioException.fromDioError(e);
    //   return Left(NetworkFailure(errorMessage: customError.customMessage));
    // } else if (e is FirebaseException) {
    //   return Left(NetworkFailure(errorMessage: e.message.toString()));}
    return Left(NetworkFailure(
        errorMessage: 'An unknown error occurred: ${e.toString()}'));
  }
}
