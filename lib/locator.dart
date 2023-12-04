import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yo_panel/core/utils/constants.dart';
import 'package:yo_panel/core/utils/prefs_operator.dart';
import 'package:yo_panel/core/utils/secure_storage_oprator.dart';
import 'package:yo_panel/features/intro/data/repositories/login_repositoryimps.dart';
import 'package:yo_panel/features/intro/domain/repositories/login_repository.dart';
import 'package:yo_panel/features/intro/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:yo_panel/features/user/data/datasources/remote/user_api_provider.dart';
import 'package:yo_panel/features/user/data/repositories/user_repositoryimpl.dart';
import 'package:yo_panel/features/user/domain/entities/user_entity.dart';
import 'package:yo_panel/features/user/domain/repositories/user_repository.dart';
import 'package:yo_panel/features/user/domain/usecases/get_user_usecase.dart';
import 'package:yo_panel/features/user/presentation/bloc/user_bloc.dart';

import 'features/intro/data/datasources/remote/login_user_api_provider.dart';
import 'features/intro/domain/usecases/loggin_user_usecase.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

final GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  //Dio
  final Dio dio = Dio(BaseOptions(baseUrl: Constants.baseUrl));
  dio.interceptors.add(TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
        printResponseMessage: true,

      )));
      locator.registerSingleton<Dio>(dio);

  //apiProviders
  locator.registerSingleton<LoginUserApiProvider>(
      LoginUserApiProvider(locator<Dio>()));

  locator.registerSingleton<UserApiProvider>(UserApiProvider(locator<Dio>()));

  //repositories
  locator.registerSingleton<LoginRepository>(
      LoginRepositoryImpl(locator<LoginUserApiProvider>()));

  locator.registerSingleton<UserRepository>(UserRepositoryImpl(locator<UserApiProvider>()));

  //useCases
  locator.registerSingleton<LoginUserUseCase>(
      LoginUserUseCase(locator<LoginRepository>()));

  locator.registerSingleton<GetUserUseCase>(GetUserUseCase(locator<UserRepository>()));

  //blocs
  locator.registerSingleton<LoginBloc>(LoginBloc(locator<LoginUserUseCase>()));

  locator.registerSingleton<UserBloc>(UserBloc(locator<GetUserUseCase>()));
  //Secure storage
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  locator.registerSingleton<FlutterSecureStorage>(secureStorage);
  locator.registerSingleton<SecureStorageOprator>(SecureStorageOprator());


  //sharedPreferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton(PrefsOperator());


  //entities
}
