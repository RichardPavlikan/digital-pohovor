import 'package:bloc/bloc.dart';
import 'package:digital/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:digital/domain/auth/usecases/log_in_from_memory_usecase.dart';
import 'package:digital/domain/auth/usecases/log_out_usecase.dart';
import 'package:digital/service_locator.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoading());

  void appStarted() async {
    final result = await sl<IsLoggedIn>().call();

    if (!result) {
      emit(SplashNotLogged());
    }

    // sign in user
    final authResult = await sl<LogInFromMemoryUsecase>().call();

    authResult.fold(
      (error) {
        sl<LogOutUsecase>().call();

        emit(SplashNotLogged());
      },
      (success) {
        emit(SplashLogged());
      },
    );
  }
}
