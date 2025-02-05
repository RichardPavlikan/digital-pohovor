part of 'users_cubit.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

final class UsersLoading extends UsersState {}

final class UsersLoaded extends UsersState {
  const UsersLoaded(this.users);

  final List<UserModel> users;
}

final class UsersError extends UsersState {
  final String message;

  const UsersError(this.message);
}
