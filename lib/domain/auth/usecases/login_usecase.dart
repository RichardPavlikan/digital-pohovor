import 'package:dartz/dartz.dart';
import 'package:digital/common/usecase/usecase.dart';
import 'package:digital/data/auth/model/login_params.dart';
import 'package:digital/domain/auth/repositories/auth_repository.dart';
import 'package:digital/service_locator.dart';

class LoginUsecase extends UseCase<Either, LoginParams> {
  @override
  Future<Either> call({LoginParams? params}) async {
    return await sl<AuthRepository>().login(params!);
  }
}
