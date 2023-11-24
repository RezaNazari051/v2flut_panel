part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable{
  final LoginStatus loginStatus;


  const LoginState({required this.loginStatus});

  LoginState copyWith({LoginStatus? newLoginStatus}){
    return LoginState(loginStatus: newLoginStatus??loginStatus);
  }

  @override
  List<Object?> get props => [loginStatus];

}