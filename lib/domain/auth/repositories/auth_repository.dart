import 'package:dartz/dartz.dart';
import 'package:digital/data/auth/model/login_params.dart';

abstract class AuthRepository {
  Future<Either> login(LoginParams params);
  Future<bool> isLoggedIn();
  Future<void> logout();
}
