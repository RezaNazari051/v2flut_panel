
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yo_panel/config/theme/app_colors.dart';

class DashboardNotificationPageView extends StatelessWidget {
  const DashboardNotificationPageView({
    super.key,
     required this.itemHeight,
  }) ;

  final double itemHeight;

  @override
  Widget build(BuildContext context) {
                        final PageController notifController = PageController(
    initialPage: 0,
  );
    return Container(
      margin: 
          const EdgeInsets.only(top: 0, left: 0, right: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      height: itemHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: notifController,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text('${index + 1} screen')));
            },
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Row(
              children: [ 
                InkWell( 
                  onTap: () {
                    notifController.previousPage(duration: const Duration(milliseconds: 300), curve:Curves.ease);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.grayColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.arrow_back_ios,
                        size: 15),
                  ),
                ),
                const Gap(10),
                InkWell(
                  onTap: () {
                    notifController.nextPage(duration: const Duration(milliseconds: 300), curve:Curves.ease);
                    
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColor.grayColor,
                        borderRadius:
                            BorderRadius.circular(5)),
                    child: const Icon(Icons.arrow_forward_ios,
                        size: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
