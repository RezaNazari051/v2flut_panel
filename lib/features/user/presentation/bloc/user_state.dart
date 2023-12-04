part of 'user_bloc.dart';

class UserState extends Equatable {
  final GetUsersStatus usersStatus;

  const UserState(this.usersStatus);

  UserState copyWith({GetUsersStatus? newUserStatus}) {
    return UserState( newUserStatus ?? usersStatus);
  }

  @override
  List<Object?> get props => [usersStatus];
}
