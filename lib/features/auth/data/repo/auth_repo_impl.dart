import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:jawali/core/errors/faluire.dart';

import 'package:jawali/core/utils/api_service.dart';
import 'package:jawali/features/auth/data/models/login_model.dart';
import 'package:jawali/features/auth/data/models/login_response.dart';

import 'package:jawali/features/auth/data/models/registration_response.dart';
import 'package:jawali/features/auth/data/models/signup_model.dart';
import 'package:jawali/features/auth/data/repo/auth_repo.dart';

class AuthRepoImple implements AuthRepo {
  final ApiService apiService;
  AuthRepoImple({required this.apiService});

  @override
  Future<Either<Failuer, RegistrationResponse>> signupRequest(
      {required RegistrationModel registrationModel}) async {
    try {
      var data = await apiService.postSignUp(
        endPoints: 'register',
        registrationModel: registrationModel,
      );
      RegistrationResponse response = RegistrationResponse.fromJson(data);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioExceptio(e));
      }
      return left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, LoginResponse>> loginRequest(
      {required LoginModel loginModel}) async {
    try {
      var data =
          await apiService.postLogin(endPoints: 'login?', loginModel: loginModel);
      LoginResponse response = LoginResponse.fromJson(data);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioExceptio(e));
      }
      return left(ServerFailuer(e.toString()));
    }
  }
}