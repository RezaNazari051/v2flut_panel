import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yo_panel/config/theme/app_colors.dart';
import 'package:yo_panel/core/widgets/responsive.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.badgeCount,
    required this.profilePicture,
  });

  final int badgeCount;
  final String profilePicture;

  @override
  Widget build(BuildContext context) {
    List<PopupAppbarMenuItem> alertItem = [
      PopupAppbarMenuItem(title: 'اطلاعیه 1', onTap: () {}),
      PopupAppbarMenuItem(title: 'اطلاعیه 2', onTap: () {}),
    ];
    List<PopupAppbarMenuItem> profileItem = [
      PopupAppbarMenuItem(title: 'نمایش پروفایل', onTap: () {}),
      PopupAppbarMenuItem(title: 'تنظیمات', onTap: () {}),
      PopupAppbarMenuItem(
          title: 'خروج از حساب',
          onTap: () {},
          itemIcon: const Icon(Icons.exit_to_app, color: Colors.red)),
    ];
    final isDesktop = Responsive.isDesktop(context);
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.testSideBarBackgroundColor,
          border: Border(bottom: BorderSide(color: AppColor.grayColor))),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Gap(20),
          if (!isDesktop)
            InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
          const Spacer(),
          PopupMenuButton(
            itemBuilder: (context) => alertItem
                .map((item) => PopupMenuItem(
                onTap: item.onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.title),
                    item.itemIcon ?? const SizedBox()
                  ],
                )))
                .toList(),
            offset: const Offset(0, 50),
            child: Badge(
              label: Text(badgeCount.toString()),
              alignment: Alignment.topRight,
              backgroundColor: AppColor.purpleColor,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.grayColor),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  CupertinoIcons.bell,
                  color: AppColor.grayColor,
                ),
              ),
            ),
          ),
          const Gap(14),
          PopupMenuButton(
            itemBuilder: (context) => profileItem
                .map((item) => PopupMenuItem(
              onTap: item.onTap,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.title),
                        item.itemIcon ?? const SizedBox()
                      ],
                    )))
                .toList(),
            offset: Offset(0, 50),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(profilePicture),
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColor.grayColor,
          ),
          const Gap(40),
        ],
      ),
    );
  }
}
class PopupAppbarMenuItem {
  String title;
  Function() onTap;
  Widget? itemIcon;

  PopupAppbarMenuItem(
      {required this.title, required this.onTap, this.itemIcon});
}
