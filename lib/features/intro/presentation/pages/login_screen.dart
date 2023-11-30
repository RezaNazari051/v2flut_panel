import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:yo_panel/core/params/login_params.dart';
import 'package:yo_panel/core/widgets/main_wrapper.dart';
import 'package:yo_panel/core/widgets/responsive.dart';
import 'package:yo_panel/core/widgets/text_field.dart';
import 'package:yo_panel/features/intro/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:yo_panel/features/intro/presentation/bloc/login_bloc/login_status.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff202227),
      body: Responsive.isMobile(context) || Responsive.isTablet(context)
          ? _getMobileAndTabletLoginForm(context,
              usernameController: usernameController,
              passwordController: passwordController)
          : _getDesktopLoginForm(context,
              usernameController: usernameController,
              passwordController: passwordController),
    );
  }
}

_getDesktopLoginForm(BuildContext context,
    {required TextEditingController usernameController,
    required TextEditingController passwordController}) {
  return Row(
    children: [
      Expanded(
          child: Padding(
        padding: const EdgeInsets.only(right: 50),
        child: BlocConsumer<LoginBloc, LoginState>(
          buildWhen: (previous, current) {
            return previous != current;
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ورود به حساب کاربری',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                AppTextFormField(
                    textFunction: (value) =>
                        value!.isEmpty ? 'ایمیل خود را وارد کنید' : null,
                    marginBottom: 20,
                    fillColor: const Color(0xff282a2f),
                    width: 500,
                    title: 'ایمیل',
                    hintText: 'ایمیل خورد را وارد نمایید',
                    controller: usernameController),
                AppTextFormField(
                    textFunction: (value) =>
                        value!.isEmpty ? 'پسورد خود را وارد کنید' : null,
                    marginBottom: 40,
                    fillColor: const Color(0xff282a2f),
                    width: 500,
                    title: 'پسورد',
                    hintText: 'پسورد خورد را وارد نمایید',
                    controller: passwordController),
                SizedBox(
                  height: 55,
                  width: 500,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff5871eb),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      if (state.loginStatus is! LoginUserLoading) {
                        if (usernameController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          final LoginParams params = LoginParams(
                              username: usernameController.text,
                              password: passwordController.text);
                          BlocProvider.of<LoginBloc>(context)
                              .add(LoginUserEvent(params));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('لطفا مقادیر ورودی را برسی کنید'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    },
                    child: state.loginStatus is LoginUserLoading
                        ? const CupertinoActivityIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'ورود به حساب',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                )
              ],
            );
          },
          listener: (context, state) {
            if (state.loginStatus is LoginUserError) {
              final LoginUserError loginUserError =
                  state.loginStatus as LoginUserError;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(loginUserError.errorMessage),
                backgroundColor: Colors.red,
              ));
            }
            if (state.loginStatus is LoginUserCompleted) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('ورود موفقیت آمیزبود'),
                  backgroundColor: Colors.green));

              Future.delayed(const Duration(seconds: 2), () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const MainWrapper(),
                    ));
              });
            }
          },
        ),
      )),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('assets/images/login_image.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
      ),
    ],
  );
}

_getMobileAndTabletLoginForm(BuildContext context,
    {required TextEditingController usernameController,
    required TextEditingController passwordController}) {
  return Stack(
    children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login_image.jpg'),
                fit: BoxFit.cover)),
      ),
      BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.loginStatus is LoginUserError) {
            final LoginUserError loginUserError =
                state.loginStatus as LoginUserError;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(loginUserError.errorMessage),
              backgroundColor: Colors.red,
            ));
          }
          if (state.loginStatus is LoginUserCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('ورود موفقیت آمیزبود'),
                backgroundColor: Colors.green));

            Future.delayed(
              const Duration(seconds: 2),
              () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const MainWrapper(),
                  ),
                );
              },
            );
          }
        },
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 50, sigmaX: 50),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'ورود به حساب کاربری',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Gap(20),
                        AppTextFormField(
                            textFunction: (value) => value!.isEmpty
                                ? 'ایمیل خود را وارد کنید'
                                : null,
                            marginBottom: 20,
                            textInputType: TextInputType.emailAddress,
                            titleFontSize: 17,
                            fillColor: Colors.transparent,
                            width: 300,
                            title: 'ایمیل',
                            hintText: 'ایمیل خورد را وارد نمایید',
                            controller: usernameController),
                        AppTextFormField(
                            textFunction: (value) => value!.isEmpty
                                ? 'پسورد خود را وارد کنید'
                                : null,
                            marginBottom: 40,
                            textInputType: TextInputType.visiblePassword,
                            titleFontSize: 17,
                            fillColor: Colors.transparent,
                            width: 300,
                            title: 'پسورد',
                            hintText: 'پسورد خورد را وارد نمایید',
                            controller: passwordController),
                        SizedBox(
                          width: 300,
                          height: 55,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            onPressed: () {
                              if (state.loginStatus is! LoginUserLoading) {
                                if (usernameController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  final LoginParams params = LoginParams(
                                      username: usernameController.text,
                                      password: passwordController.text);
                                  BlocProvider.of<LoginBloc>(context)
                                      .add(LoginUserEvent(params));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('لطفا مقادیر ورودی را برسی کنید'),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              }
                            },
                            child: state.loginStatus is LoginUserLoading
                                ? const CupertinoActivityIndicator(
                              color: Colors.white,
                            )
                                : const Text(
                              'ورود به حساب',
                              style: TextStyle(color: Colors.white),
                            ),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ],
  );
}
