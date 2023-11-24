part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
}

class LoginUserEvent extends LoginEvent{
  final LoginParams loginParams;

  LoginUserEvent(this.loginParams);

  @override
  List<Object?> get props => [loginParams];

}
