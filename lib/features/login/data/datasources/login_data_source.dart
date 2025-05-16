import 'package:clean_architecture_practice/core/errors/error_handler.dart';
import 'package:clean_architecture_practice/core/errors/failures.dart';
import 'package:clean_architecture_practice/core/services/api_service.dart';
import 'package:clean_architecture_practice/features/login/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/params/login_params.dart';

abstract class LoginDataSource {
  Future<Either<Failure, String>> login({required LoginParams login});

  Future<Either<Failure, UserModel>> getProfile({required String token});
}

class LoginDataSourceImpl extends LoginDataSource {
  final apiService = ApiService();

  @override
  Future<Either<Failure, UserModel>> getProfile({required String token}) {
    return handleNetworkError(() async {
      final response = await apiService.get(
        'https://backend.mycareertoolbox.com/api/user/my-profile',
        queryParams: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );
      print('Success ${response.data}');
      final UserModel user = UserModel.fromJson(response.data['data']);
      print('USERR ${user.email}');
      return user;
    });
  }

  @override
  Future<Either<Failure, String>> login({required LoginParams login}) async {
    return handleNetworkError(() async {
      final response = await apiService.post(
          'https://backend.mycareertoolbox.com/api/auth/login',
          data: {'email': login.email, 'password': login.password});
      if (response.statusCode == 200) {
        print('Success login');
      } else {
        print('Fail login');
      }
      return response.data['token'];
    });
  }
}
