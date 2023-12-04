import 'package:dio/dio.dart';
import 'package:yo_panel/core/params/login_params.dart';
import 'package:yo_panel/core/utils/constants.dart';

class LoginUserApiProvider{
  final Dio dio;
  final baseUrl=Constants.baseUrl;

  LoginUserApiProvider(this.dio);

  Future<dynamic>callLoginUser({required LoginParams params})async{
    
  final Response response=await  dio.post('$baseUrl/User/Login',data: {
      'username':params.username,
      'password':params.password
    });
  return response;
  }
}

