import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yo_panel/core/widgets/responsive.dart';
import 'package:yo_panel/core/widgets/sidebar_widget.dart';
import 'package:yo_panel/features/user/presentation/pages/users_screen.dart';

import '../../features/dashboard/presentation/pages/dashboard_screen.dart';
import '../blocs/cubit/side_bar_cubit.dart';
import 'custom_appbar.dart';

class MainWrapper extends StatelessWidget {

  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens= [const DashboardScreen(),const UsersScreen()];
  final PageController controller=PageController(initialPage: 0);

    final isDesktop = Responsive.isDesktop(context);
    // final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      drawer:  Drawer(child: AppSideBar(pageController: controller,)),
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)  AppSideBar(pageController: controller),
            Expanded(
              child: Column(
                children: [
                  const CustomAppBar(
                    badgeCount: 2,
                    profilePicture: 'assets/images/selfie.jpeg',
                  ),
                  BlocBuilder<SideBarCubit, int>(
                    builder: (context, state) {

                      return Expanded(
                        child: PageView.builder(
                          controller: controller,
                          itemCount: 2,
                          physics: const NeverScrollableScrollPhysics(),

                          onPageChanged: (value) {
                          },
                          itemBuilder: (context, index) {
                            // final pageIndex =
                            //     context.read<SideBarCubit>().state;
                            return UsersScreen();
                            // return DashboardScreen();
                            // return screens[index];
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}