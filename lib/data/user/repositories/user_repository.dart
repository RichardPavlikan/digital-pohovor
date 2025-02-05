import 'package:dartz/dartz.dart';
import 'package:digital/data/user/models/user_model.dart';
import 'package:digital/data/user/service/user_service.dart';
import 'package:digital/domain/user/repositories/user_repository.dart';
import 'package:digital/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<Either> getUser() async {
    final userEmail = await sl<FlutterSecureStorage>().read(key: "auth_email");

    if (userEmail == null) {
      return const Left("User email not found");
    }

    final result = await sl<UserService>().getUsers();

    return result.fold(
      (error) {
        return Left(error);
      },
      (succes) {
        final List<UserModel> userModel = [];

        debugPrint("succes: $succes");

        final List users = succes['items'];

        for (var user in users) {
          userModel.add(UserModel.fromJson(user));
        }

        final foundUser =
            userModel.firstWhere((element) => element.email == userEmail);

        return Right(foundUser);
      },
    );
  }

  @override
  Future<Either> getUsers() async {
    final result = await sl<UserService>().getUsers();

    return result.fold(
      (error) {
        return Left(error);
      },
      (succes) {
        final List<UserModel> userModel = [];

        debugPrint("succes: $succes");

        final List users = succes['items'];

        for (var user in users) {
          userModel.add(UserModel.fromJson(user));
        }

        return Right(userModel);
      },
    );
  }
}
