import 'package:dio/dio.dart';
import 'package:jawali/features/auth/data/models/login_model.dart';

import 'package:jawali/features/auth/data/models/signup_model.dart';

class ApiService {

  final String _baseURL = 'http://127.0.0.1:8000/api/';
  final Dio _dio;

  ApiService(this._dio);

  //signup
  Future<Map<String, dynamic>> postSignUp({
    required String endPoints,
    required RegistrationModel registrationModel,
  }) async {
    var response = await _dio.post(
      '$_baseURL$endPoints',
      data: {
        'name': registrationModel.name,
        'email': registrationModel.email,
        'password': registrationModel.password,
        'password_confirmation': registrationModel.confirmPassowrd,
      },
    );
    return response.data;
  }


  //login
  Future<Map<String, dynamic>> postLogin(
      {required String endPoints, required LoginModel loginModel}) async {
    var response = await _dio.post('$_baseURL$endPoints', data: {
      'email': loginModel.email,
      'password': loginModel.passowrd,
    });
    return response.data;
  }

}