import 'package:digital/domain/auth/repositories/auth_repository.dart';
import 'package:digital/service_locator.dart';

class LogOutUsecase {
  Future<void> call() async {
    await sl<AuthRepository>().logout();
  }
}
