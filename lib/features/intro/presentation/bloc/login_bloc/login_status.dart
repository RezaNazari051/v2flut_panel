import 'package:equatable/equatable.dart';
import 'package:yo_panel/features/intro/domain/entities/login_data_entity.dart';

abstract class LoginStatus extends Equatable{

}

class LoginUserInitial extends LoginStatus{

  @override
  List<Object?> get props => [];

}
class LoginUserLoading extends LoginStatus{

  @override
  List<Object?> get props => [];

}
class LoginUserCompleted extends LoginStatus{
  final LoginDataEntity loginDataEntity;

  LoginUserCompleted(this.loginDataEntity);

  @override
  List<Object?> get props => [loginDataEntity];

}
class LoginUserError extends LoginStatus{
  final String errorMessage;


  LoginUserError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];

}