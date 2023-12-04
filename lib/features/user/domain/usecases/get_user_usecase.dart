import 'package:yo_panel/core/params/get_users_params.dart';
import 'package:yo_panel/core/resources/data_state.dart';
import 'package:yo_panel/core/resources/use_case.dart';
import 'package:yo_panel/features/user/domain/entities/user_entity.dart';
import 'package:yo_panel/features/user/domain/repositories/user_repository.dart';

class GetUserUseCase implements UseCase<DataState<UserEntity>, GetUsersParams> {
  final UserRepository userRepository;

  GetUserUseCase(this.userRepository);

  @override
  Future<DataState<UserEntity>> call(GetUsersParams param) {
    return userRepository.fetchGetUsers(param);
  }
}
