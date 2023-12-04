import 'package:dio/dio.dart';
import 'package:yo_panel/core/params/get_users_params.dart';

class UserApiProvider {
  final Dio _dio;

  UserApiProvider(this._dio);

  Future<dynamic> callGetUsers(GetUsersParams params) async {
    final Response response = await _dio.get(
      '/user/GetAll',
      queryParameters: {
        'SortType': params.sortType,
        'page': params.page,
      },
      options: Options(
        headers: {
          'Authorization':
              '8452590aaa8ebad2720614ea77f5b17659af88a0ef626ca3c234eff0d651886b'
        },
      ),
    );
    return response;
  }
}
