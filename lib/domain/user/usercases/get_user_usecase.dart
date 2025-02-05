import 'package:dartz/dartz.dart';
import 'package:digital/common/usecase/usecase.dart';
import 'package:digital/domain/user/repositories/user_repository.dart';
import 'package:digital/service_locator.dart';

class GetUserUsecase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    final idResult = await sl<UserRepository>().getUser();

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
