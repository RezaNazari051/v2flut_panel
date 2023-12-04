import 'package:equatable/equatable.dart';
import 'package:yo_panel/features/user/domain/entities/user_entity.dart';

abstract class GetUsersStatus extends Equatable {}

class GetUserLoading extends GetUsersStatus {
  @override
  List<Object?> get props => [];
}

class GetUserCompleted extends GetUsersStatus {
  final UserEntity userEntity;

  GetUserCompleted(this.userEntity);

  @override
  List<Object?> get props => [userEntity];
}

class GetUserError extends GetUsersStatus {
  final String errorMessage;

  GetUserError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
