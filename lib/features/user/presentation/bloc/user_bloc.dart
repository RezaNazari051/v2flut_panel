import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yo_panel/core/params/get_users_params.dart';
import 'package:yo_panel/core/resources/data_state.dart';
import 'package:yo_panel/features/user/presentation/bloc/get_users_status.dart';

import '../../domain/usecases/get_user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase getUserUseCase;
  
  UserBloc(this.getUserUseCase) : super(UserState(GetUserLoading())) {
    on<GetAllUserEvent>((event, emit)async {
      
      emit(state.copyWith(newUserStatus: GetUserLoading()));
      
      DataState dataState=await getUserUseCase(event.params);
      if(dataState is DataSuccess){
        emit(state.copyWith(newUserStatus: GetUserCompleted(dataState.data!)));
      }
      if(dataState is DataFailed){
        emit(state.copyWith(newUserStatus: GetUserError(dataState.error!)));
      }
      
      
    });
  }
}
