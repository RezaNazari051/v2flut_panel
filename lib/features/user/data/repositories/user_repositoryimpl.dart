import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:yo_panel/core/params/get_users_params.dart';
import 'package:yo_panel/core/resources/data_state.dart';
import 'package:yo_panel/features/user/data/datasources/remote/user_api_provider.dart';
import 'package:yo_panel/features/user/data/models/user_model.dart';
import 'package:yo_panel/features/user/domain/entities/user_entity.dart';
import 'package:yo_panel/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserApiProvider apiProvider;

  UserRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<UserEntity>> fetchGetUsers(GetUsersParams params) async {
    try {
      final Response response = await apiProvider.callGetUsers(params);

      if (response.statusCode == 200) {
        final UserEntity userEntity = UserModel.fromJson(response.data);

        return DataSuccess(userEntity);
      } else {
        return DataFailed('خطایی رخ داد،لطفا مجدد تلاش کنید');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return DataFailed(e.response!.data['Message']);
      } else {
        return DataFailed(e.message.toString());
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
