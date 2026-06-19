import 'package:dartz/dartz.dart';

import 'package:jawali/core/errors/faluire.dart';
import 'package:jawali/features/auth/data/models/login_model.dart';
import 'package:jawali/features/auth/data/models/login_response.dart';

import 'package:jawali/features/auth/data/models/registration_response.dart';
import 'package:jawali/features/auth/data/models/signup_model.dart';

abstract class AuthRepo {
  Future<Either<Failuer, RegistrationResponse>> signupRequest(
      {required RegistrationModel registrationModel});

 Future<Either<Failuer, LoginResponse>> loginRequest(
      {required LoginModel loginModel});
}