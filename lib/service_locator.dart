import 'package:digital/data/auth/repositories/auth_repository.dart';
import 'package:digital/data/auth/services/api_service.dart';
import 'package:digital/data/user/repositories/user_repository.dart';
import 'package:digital/data/user/service/user_service.dart';
import 'package:digital/domain/auth/repositories/auth_repository.dart';
import 'package:digital/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:digital/domain/auth/usecases/log_in_from_memory_usecase.dart';
import 'package:digital/domain/auth/usecases/log_out_usecase.dart';
import 'package:digital/domain/auth/usecases/login_usecase.dart';
import 'package:digital/domain/user/repositories/user_repository.dart';
import 'package:digital/domain/user/usercases/get_user_usecase.dart';
import 'package:digital/domain/user/usercases/get_users_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // packages
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

  // services
  sl.registerSingleton<ApiService>(ApiServiceImpl());
  sl.registerSingleton<UserService>(UserServiceImpl());

  // repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<UserRepository>(UserRepositoryImpl());

  // usecases
  sl.registerSingleton<LoginUsecase>(LoginUsecase());
  sl.registerSingleton<IsLoggedIn>(IsLoggedIn());
  sl.registerSingleton<GetUserUsecase>(GetUserUsecase());
  sl.registerSingleton<GetUsersUsecase>(GetUsersUsecase());
  sl.registerSingleton<LogOutUsecase>(LogOutUsecase());
  sl.registerSingleton<LogInFromMemoryUsecase>(LogInFromMemoryUsecase());
}
