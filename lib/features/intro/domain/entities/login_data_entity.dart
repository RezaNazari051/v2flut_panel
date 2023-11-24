import 'package:equatable/equatable.dart';

class LoginDataEntity extends Equatable{
  final String token;
  final int role;


  const LoginDataEntity({required this.token,required  this.role});

  @override
  List<Object?> get props => throw UnimplementedError();


}