import 'package:dartz/dartz.dart';
import 'package:digital/data/auth/model/auth_response.dart';
import 'package:digital/data/auth/model/login_params.dart';
import 'package:digital/data/auth/services/api_service.dart';
import 'package:digital/domain/auth/repositories/auth_repository.dart';
import 'package:digital/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> login(LoginParams params) async {
    final result = await sl<ApiService>().login(params);

    return result.fold((error) {
      debugPrint("Error: $error");
      return Left(error);
    }, (success) {
      final token = AuthResponse.fromJson(success).token;

      // save token to local storage
      sl<FlutterSecureStorage>().write(
        key: "auth_token",
        value: token,
      );
      sl<FlutterSecureStorage>().write(
        key: "auth_email",
        value: params.email,
      );
      sl<FlutterSecureStorage>().write(
        key: "auth_password",
        value: params.password,
      );

      return Right(
        AuthResponse(token: token),
      );
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    // check if token is stored in local storage
    return await sl<FlutterSecureStorage>().read(key: "auth_token") != null;
  }

  @override
  Future<void> logout() {
    return sl<FlutterSecureStorage>().deleteAll();
  }
}
