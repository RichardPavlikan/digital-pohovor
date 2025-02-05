import 'package:dartz/dartz.dart';
import 'package:digital/data/auth/model/login_params.dart';
import 'package:digital/domain/auth/repositories/auth_repository.dart';
import 'package:digital/service_locator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LogInFromMemoryUsecase {
  Future<Either> call() async {
    final email = await sl<FlutterSecureStorage>().read(key: "auth_email");
    final pass = await sl<FlutterSecureStorage>().read(key: "auth_password");

    if (email == null || pass == null) {
      return const Left("No user found");
    }

    final result = await sl<AuthRepository>()
        .login(LoginParams(email: email, password: pass));

    return result.fold((error) {
      return Left(error);
    }, (success) {
      return Right(success);
    });
  }
}
