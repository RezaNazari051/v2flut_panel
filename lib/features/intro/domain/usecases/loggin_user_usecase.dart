import 'package:yo_panel/core/params/login_params.dart';
import 'package:yo_panel/core/resources/use_case.dart';
import 'package:yo_panel/features/intro/domain/entities/login_data_entity.dart';
import 'package:yo_panel/features/intro/domain/repositories/login_repository.dart';

import '../../../../core/resources/data_state.dart';

class LoginUserUseCase implements UseCase<DataState<LoginDataEntity>,LoginParams>{
  final LoginRepository loginRepository;

  LoginUserUseCase(this.loginRepository);

  @override
  Future<DataState<LoginDataEntity>> call(LoginParams param) {
    return loginRepository.fetchLogin(param);
  }


}