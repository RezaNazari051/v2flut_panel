import 'package:yo_panel/features/user/domain/entities/user_entity.dart';

import '../../../../core/params/get_users_params.dart';
import '../../../../core/resources/data_state.dart';

abstract class UserRepository {

  Future<DataState<UserEntity>>fetchGetUsers(GetUsersParams params);


}