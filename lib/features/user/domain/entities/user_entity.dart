import 'package:equatable/equatable.dart';
import 'package:yo_panel/features/user/data/models/user_model.dart';

class UserEntity extends Equatable{
  final List<Result?>? result;
  final int? total;


  const UserEntity({required this.result,required this.total,});

  @override
  List<Object?> get props => throw UnimplementedError();



}