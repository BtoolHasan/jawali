// lib/core/services/get_it_service.dart

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:jawali/core/utils/api_service.dart';

import 'package:jawali/features/auth/data/repo/auth_repo.dart';
import 'package:jawali/features/auth/data/repo/auth_repo_impl.dart';


import 'package:jawali/features/auth/presentation/manager/login_cubit/login_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(
      getIt<Dio>(),
    ),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImple(
      apiService: getIt<ApiService>(),
    ),
  );

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt<AuthRepo>(),
    ),
  );
}