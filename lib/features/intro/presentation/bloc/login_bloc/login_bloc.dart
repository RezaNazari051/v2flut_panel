
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:yo_panel/core/params/login_params.dart';
import 'package:yo_panel/features/intro/presentation/bloc/login_bloc/login_status.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../domain/usecases/loggin_user_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserUseCase loginUserUseCase;

  LoginBloc(this.loginUserUseCase) : super(LoginState(loginStatus: LoginUserInitial())) {

    on<LoginUserEvent>((event, emit) async {
      emit(state.copyWith(newLoginStatus: LoginUserLoading()));

      DataState dataState=await loginUserUseCase(event.loginParams);
      if(dataState is DataSuccess){
        emit(state.copyWith(newLoginStatus: LoginUserCompleted(dataState.data)));
      }
      if(dataState is DataFailed){
        emit(state.copyWith(newLoginStatus: LoginUserError(dataState.error!)));
      }

    });
  }
}
