import 'package:dio/dio.dart';
import 'package:yo_panel/core/params/login_params.dart';
import 'package:yo_panel/core/resources/data_state.dart';
import 'package:yo_panel/features/intro/data/datasources/local/login_user_api_provider.dart';
import 'package:yo_panel/features/intro/data/models/login_model.dart';
import 'package:yo_panel/features/intro/domain/entities/login_data_entity.dart';
import 'package:yo_panel/features/intro/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository{
  final LoginUserApiProvider apiProvider;


  LoginRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<LoginDataEntity>> fetchLogin(LoginParams params)async {
    try{
    final Response response=await apiProvider.callLoginUser(params: params);
    if(response.statusCode==200){

      final LoginDataEntity loginDataEntity=LoginModel.fromJson(response.data);
      return DataSuccess(loginDataEntity);
    }
    else{ 
      return DataFailed('خطایی رخ داد،لطفا مجدد تلاش کنید');
    }

    }on DioException catch(e){
      if(e.message!=null){
        return DataFailed(e.response?.data);
      }
      else{
        return DataFailed(e.error.toString());
      }
    }
    catch(e){
      return DataFailed(e.toString());

    }

  }

}