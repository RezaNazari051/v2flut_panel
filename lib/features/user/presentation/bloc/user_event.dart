part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllUserEvent extends UserEvent{
  final GetUsersParams params;

  GetAllUserEvent(this.params);
}
