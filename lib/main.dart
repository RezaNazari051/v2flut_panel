import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yo_panel/config/theme/app_colors.dart';
import 'package:yo_panel/core/blocs/cubit/side_bar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yo_panel/features/intro/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:yo_panel/features/intro/presentation/pages/login_screen.dart';
import 'package:yo_panel/features/user/presentation/bloc/user_bloc.dart';
import 'package:yo_panel/locator.dart';

import 'core/widgets/main_wrapper.dart';
import 'firebase_options.dart';

void main() async {
  // ebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        //Cubits
        BlocProvider(create: (_) => SideBarCubit()),

        //blocs
        BlocProvider(create: (_) => LoginBloc(locator())),

        BlocProvider(create: (_) => UserBloc(locator()))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            iconButtonTheme: IconButtonThemeData(
                style: ButtonStyle(
                    iconColor: MaterialStateProperty.all<Color>(Colors.white))),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white, fontSize: 25),
              bodyMedium: TextStyle(color: Colors.white, fontSize: 15),
              bodySmall: TextStyle(color: Colors.white, fontSize: 15),
              titleLarge: TextStyle(color: Colors.white, fontSize: 30),
            ),
            hintColor: AppColor.grayColor,
            scrollbarTheme: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(Colors.white)),
            scaffoldBackgroundColor: AppColor.testScaffoldBackgroundColor,
            fontFamily: 'IranYekan'),
        locale: const Locale('fa', 'ir'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('fa', 'IR'),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Yoservice Admin Panel',
        home: const MainWrapper());
    // home:  const LoginScreen());
  }
}
