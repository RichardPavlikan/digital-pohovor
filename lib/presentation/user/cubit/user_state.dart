part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  const UserLoaded(this.user);

  final UserModel user;
}

final class UserError extends UserState {
  final String message;

  const UserError(this.message);
}
