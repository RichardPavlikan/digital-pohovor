import 'package:dartz/dartz.dart';
import 'package:digital/domain/user/repositories/user_repository.dart';
import 'package:digital/service_locator.dart';

class GetUsersUsecase {
  Future<Either> call() async {
    final idResult = await sl<UserRepository>().getUsers();

    return idResult.fold(
      (error) {
        return Left(error);
      },
      (user) async {
        return Right(user);
      },
    );
  }
}
