import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yo_panel/core/widgets/responsive.dart';
import 'package:yo_panel/core/widgets/sidebar_widget.dart';

import '../../features/dashboard/presentation/pages/dashboard_screen.dart';
import '../blocs/cubit/side_bar_cubit.dart';
import 'custom_appbar.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    // final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      drawer: const Drawer(child: AppSideBar()),
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop) const AppSideBar(),
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
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            // final pageIndex =
                            //     context.read<SideBarCubit>().state;
                            return const DashboardScreen();
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