import 'package:bloc/bloc.dart';
import 'package:digital/data/user/models/user_model.dart';
import 'package:digital/domain/user/usercases/get_users_usecase.dart';
import 'package:digital/service_locator.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersLoading());

  void getUsers() async {
    emit(UsersLoading());

    final result = await sl<GetUsersUsecase>().call();

    result.fold(
      (error) {
        emit(UsersError(error));
      },
      (user) {
        emit(UsersLoaded(user));
      },
    );
  }
}
