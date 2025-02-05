import 'package:bloc/bloc.dart';
import 'package:digital/data/user/models/user_model.dart';
import 'package:digital/domain/auth/usecases/log_out_usecase.dart';
import 'package:digital/domain/user/usercases/get_user_usecase.dart';
import 'package:digital/service_locator.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoading());

  void getUser() async {
    final result = await sl<GetUserUsecase>().call();

    result.fold(
      (error) {
        emit(UserError(error));
      },
      (user) {
        emit(UserLoaded(user));
      },
    );
  }

  void logout() async {
    emit(UserLoading());
    await sl<LogOutUsecase>().call();
  }
}
