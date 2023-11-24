import 'package:yo_panel/core/params/login_params.dart';
import 'package:yo_panel/core/resources/data_state.dart';
import 'package:yo_panel/features/intro/domain/entities/login_data_entity.dart';

abstract  class LoginRepository{

Future <DataState<LoginDataEntity>>fetchLogin(LoginParams params);
}