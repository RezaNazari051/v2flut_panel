import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yo_panel/config/theme/app_colors.dart';
import 'package:yo_panel/core/blocs/cubit/side_bar_cubit.dart';

class AppSideBar extends StatefulWidget {
  const AppSideBar({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<AppSideBar> createState() => _AppSideBarState();
}

class _AppSideBarState extends State<AppSideBar> {


  @override
  Widget build(BuildContext context) {
    List<SideBarItemData> items = [
      SideBarItemData(
        title: 'داشبورد',
          // title: '',
          leadingIcon: Icons.dashboard_outlined,
          selectedleadingIcon: Icons.dashboard),
      SideBarItemData(
        title: 'کاربران',
          // title: '',
          leadingIcon: Icons.person_outline,
          selectedleadingIcon: Icons.person),
      SideBarItemData(
        title: 'تنظیمات',
          // title: '',
          leadingIcon: Icons.settings_outlined,
          selectedleadingIcon: Icons.settings),
    ];
    return Container(
      width: 250,
      decoration: const BoxDecoration(
          color: AppColor.testSideBarBackgroundColor
      ),
      child: Column(
        children: [
          const Gap(20),
          Expanded(child: BlocBuilder<SideBarCubit, int>(
            builder: (context, state) {
              final int selectedIndex = context
                  .read<SideBarCubit>()
                  .state;

              return ListView.builder(itemBuilder:  (context, index) {
                return SideBarListItem(
                    title: items[index].title,
                    ontap: () {
                      if (selectedIndex != index) {
                        BlocProvider.of<SideBarCubit>(context)
                            .changePageIndex(index);
                        widget.pageController.animateToPage(index,
                            duration: const Duration(microseconds: 300),
                            curve: Curves.ease);
                      }
                    },
                    selectedLeadingIcon: items[index].selectedleadingIcon,
                    leadingIcon: items[index].leadingIcon,
                    isSelectedItem: selectedIndex == index);
              }, itemCount:items.length);
            },
          ))
        ],
      ),
    );
  }
}
class SideBarListItem extends StatelessWidget {
  const SideBarListItem({
    super.key,
    required this.title,
    required this.ontap,
    required this.leadingIcon,
    required this.selectedLeadingIcon,
    required this.isSelectedItem,
    this.leadingWidget,
  });

  final String title;
  final Function() ontap;
  final IconData leadingIcon;
  final IconData selectedLeadingIcon;
  final bool isSelectedItem;
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        minVerticalPadding: 15,
        onTap: ontap,
        contentPadding: EdgeInsets.zero,
        leading: isSelectedItem
            ? Container(
          width: 5,
          height: double.infinity,
          color: Colors.white,
        )
            : const SizedBox.shrink(),
        title: Row(
          children: [
            if (leadingWidget == null)
              Icon(isSelectedItem ? selectedLeadingIcon : leadingIcon,
                  color: Colors.white)
            else
              leadingWidget!,
            Text(
              title,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class SideBarItemData {
  SideBarItemData({required this.title,
    required this.leadingIcon,
    required this.selectedleadingIcon,
    this.leadingWidget});

  final String title;
  final IconData leadingIcon;
  final IconData selectedleadingIcon;
  Widget? leadingWidget;
}
