import 'package:digital/domain/auth/repositories/auth_repository.dart';
import 'package:digital/service_locator.dart';

class IsLoggedIn {
  Future<bool> call() async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
